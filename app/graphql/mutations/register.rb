module Mutations
  # 注册还是改成接收企业名称的接口
  class Register < GraphqlDevise::Mutations::Register
    def resolve(**attrs)
      # todo 看不懂
      self.class.instance_variable_set(:@resource_klass, User)

      # todo 为什么要用事务
      ActiveRecord::Base.transaction do
        p "新規アカウント発行 user"
        org = Organization.first
        super(**attrs.merge(organization: org, role: owner))
      end
    end
  end
end
