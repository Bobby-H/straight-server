require 'ostruct'

module StraightServer
  # :db
  # :gateways_source
  # :gateways
  # :logmaster
  # :server_secret
  # :count_orders
  # :environment
  # :redis
  # :check_order_status_in_db_first
  # :port
  # :blockchain_adapters
  # :expiration_overtime
  # :reuse_address_orders_threshold
  # :throttle

  class << (Config = OpenStruct.new)
    def [](key_chain)
      key_chain = key_chain.to_s.split('.')
      config    = public_send(key_chain.shift)
      key_chain.each do |key|
        if config.is_a?(Hash)
          config = config[key] || config[key.to_sym]
        else
          return
        end
      end
      config
    end
  end
end
