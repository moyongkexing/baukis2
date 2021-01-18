class Admin::TopController < ApplicationController
    def index
        raise IpAdressRejected
        render action: "index"
    end
end
