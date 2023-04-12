# frozen_string_literal: true

require 'factory_bot_rails'

Given('{int} example users exist') do |num_users|
  # Create users
  (1..num_users).each do |i|
    FactoryBot.create(:user, id: i)
  end
end

Given('{int} example programs exist') do |num_programs|
  # Create programs
  (1..num_programs).each do |i|
    FactoryBot.create(
      :program,
      id: i,
      name: "Program #{i}"
    )
  end
end

Given('{int} example entities exist') do |num_entities|
  # Create programs
  (1..num_entities).each do |i|
    FactoryBot.create(
      :entity,
      id: i,
      name: "Entity #{i}"
    )
  end
end

Given('{int} example vendors exist') do |num_vendors|
  # Create programs
  (1..num_vendors).each do |i|
    FactoryBot.create(
      :vendor,
      id: i,
      name: "Vendor #{i}"
    )
  end
end

Given('{int} example contracts exist') do |num_contracts|
  # Create multiple contracts
  (1..num_contracts).each do |i|
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
end

Given('{int} example contract documents exist') do |num_contract_docs|
  # Create multiple contracts
  (1..num_contract_docs).each do |i|
    FactoryBot.create(
      :contract_document,
      id: i,
      contract: Contract.all.sample
    )
  end
end

Given(/^db is set up$/) do
  step '5 example users exist'
  step '5 example programs exist'
  step '5 example entities exist'
  step '5 example vendors exist'
  step '10 example contracts exist'
  step '10 example contract documents exist'

  # Create vendor reviews manually since they have a (user, vendor) unique index
  used_user_vendor_combos = []
  (1..10).each do |i|
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
end
