# frozen_string_literal: true

class MemberRegistrationSerializer < ActiveModel::Serializer
  attributes :id, :name, :success_members_number, :failed_members_number, :success_members, :failed_members

  def success_members_number
    success_members_list.count
  end

  def failed_members_number
    failed_members_list.count
  end

  def success_members
    success_members_list.map do |member|
      UserSerializer.new(member)
    end
  end

  def failed_members
    failed_members_list
  end

  private

  def success_members_list
    @success_members_list ||= service.success_members
  end

  def failed_members_list
    @failed_members_list ||= service.failed_members
  end

  def service
    @service ||= @instance_options[:service]
  end
end
