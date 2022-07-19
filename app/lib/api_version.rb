class ApiVersion 
    def initialize(version, default = false)
        @version = version
        @default = default
    end

    def matches?(request)
        check_headers(request.headers) || default
    end

    private
    def check_headers 
        accept = headers[:accept]
        accept && accept.include?("application/vnd.todos.#{version}+json")
    end
end