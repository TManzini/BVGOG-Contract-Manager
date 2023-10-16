# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'factory_bot_rails'

# Redirect stdout to a null device
# orig_stdout = $stdout.clone
# $stdout.reopen(File.new('/dev/null', 'w'))

# ------------ DEV/TEST SEEDS ------------

if Rails.env.production?

  PROGRAM_NAMES = [
    '9-1-1',
    'AAA',
    'Admin',
    'CIHC',
    'ECD',
    'Energy-CSBG',
    'Fiber',
    'Head Start',
    'HIV',
    'Housing',
    'PSP',
    'PSA',
    'Solid Waste',
    'Transportation',
    'WIC',
    'Workforce'
  ].freeze

  # Create programs
  PROGRAM_NAMES.each do |program_name|
    FactoryBot.create(
      :program,
      name: program_name
    )
  end

  ENTITY_NAMES = %w[
    BVCOG
    BVCAP
    Brazos2020
  ].freeze

  # Create entities
  ENTITY_NAMES.each do |entity_name|
    FactoryBot.create(
      :entity,
      name: entity_name
    )
  end

  # Create admin user
  FactoryBot.create(
    :user,
    email: 'admin@bvcogdev.com',
    password: 'password',
    first_name: 'BVCOG',
    last_name: 'Admin',
    level: UserLevel::ONE,
    program: Program.first,
    # Invitation already accepted
    invitation_accepted_at: Time.now
  )

  # Create admin user
  FactoryBot.create(
    :user,
    email: 'gatekeeper@bvcogdev.com',
    password: 'password',
    first_name: 'BVCOG',
    last_name: 'Gatekeeper',
    level: UserLevel::TWO,
    program: Program.first,
    # Invitation already accepted
    invitation_accepted_at: Time.now
  )

  # Create admin user
  FactoryBot.create(
    :user,
    email: 'user@bvcogdev.com',
    password: 'password',
    first_name: 'BVCOG',
    last_name: 'User',
    level: UserLevel::THREE,
    program: Program.first,
    # Invitation already accepted
    invitation_accepted_at: Time.now
  )

  BvcogConfig.create(
    contracts_path: Rails.root.join('public/contracts'),
    reports_path: Rails.root.join('public/reports')
  )

else
  # Create programs
  (1..5).each do |i|
    FactoryBot.create(
      :program,
      id: i,
      name: "Program #{i}"
    )
  end

  # Create entities
  (1..5).each do |i|
    FactoryBot.create(
      :entity,
      id: i,
      name: "Entity #{i}"
    )
  end

  # Create users
  (1..50).each do |i|
    FactoryBot.create(
      :user,
      id: i,
      level: UserLevel.enumeration.except(:zero).keys.sample,
      program: Program.all.sample,
      entities: Entity.all.sample(rand(1..3))
    )
  end
  # Create a level 3 user
  FactoryBot.create(
    :user,
    email: 'user@example.com',
    password: 'password',
    first_name: 'Example',
    last_name: 'User',
    program: Program.all.sample,
    entities: Entity.all.sample(rand(0..Entity.count)),
    level: UserLevel::THREE
  )

  # Create a level 2 user
  FactoryBot.create(
    :user,
    email: 'gatekeeper@example.com',
    password: 'password',
    first_name: 'Gatekeeper',
    last_name: 'User',
    program: Program.all.sample,
    entities: Entity.all.sample(rand(0..Entity.count)),
    level: UserLevel::TWO
  )

  # Create a level 1 user
  FactoryBot.create(
    :user,
    email: 'admin@example.com',
    password: 'password',
    first_name: 'Admin',
    last_name: 'User',
    program: Program.all.sample,
    entities: Entity.all.sample(rand(0..Entity.count)),
    level: UserLevel::ONE
  )

  # Create vendors
  (1..50).each do |i|
    FactoryBot.create(
      :vendor,
      id: i,
      name: "Vendor #{i}"
    )
  end

  # Create multiple contracts
  (1..50).each do |i|
    FactoryBot.create(
      :contract,
      id: i,
      title: "Contract #{i}",
      entity: Entity.all.sample,
      program: Program.all.sample,
      point_of_contact: User.all.sample,
      vendor: Vendor.all.sample
    )
  end

  contact_person = User.find_by(email: 'user@example.com')
  # Create some documents with nearby expiries to test expiring docs mailer
  (1..100).each do |i|
    FactoryBot.create(
      :contract,
      id: 50 + i,
      point_of_contact: contact_person,
      title: "Expiry Contract #{i}",
      program: Program.all.sample,
      vendor: Vendor.all.sample,
      entity: Entity.all.sample,
      ends_at: Date.today + 1.days * i
    )
  end

  # Create contract documents
  (1..500).each do |i|
    FactoryBot.create(
      :contract_document,
      id: i,
      contract: Contract.all.sample
    )
  end

  # Create vendor reviews manually since they have a (user, vendor) unique index
  used_user_vendor_combos = []
  (1..100).each do |i|
    user = User.all.sample
    vendor = Vendor.all.sample
    redo if used_user_vendor_combos.include?([user.id, vendor.id])
    FactoryBot.create(
      :vendor_review,
      id: i,
      user:,
      vendor:
    )
    used_user_vendor_combos << [user.id, vendor.id]
  end

  # BVCOG Config
  # Create the directories if they don't exist
  Dir.mkdir(Rails.root.join('public/contracts')) unless Dir.exist?(Rails.root.join('public/contracts'))
  Dir.mkdir(Rails.root.join('public/reports')) unless Dir.exist?(Rails.root.join('public/reports'))

  # Create the config
  BvcogConfig.create(
    id: 1,
    contracts_path: Rails.root.join('public/contracts'),
    reports_path: Rails.root.join('public/reports')
  )

  # ------------ PROD SEEDS ------------

end
