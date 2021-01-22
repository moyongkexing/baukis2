class StaffMember < ApplicationRecord
    has_many :events, class_name: "StaffEvent", dependent: destroy
    
    def password=(raw_password)
        if raw_password.kind_of?(String)
            self.hashed_password = BCrypt::Password.create(raw_password)
        elsif raw_password.nil?
            self.hashed_password = nil
        end
    end

    def active?
        !suspended? && start_date <= Date.today && (end_date.nil? || end_date > Date.today)
        # 停止されてないよね？未来じゃなく過去に入社した人だよね？まだ退社してないよね？
    end
end
