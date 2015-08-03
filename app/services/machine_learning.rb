# MachineLearning.create_post({Empl: '10181', Project: '103531', Hours: '0'})
class MachineLearning
  API_URI = "https://ussouthcentral.services.azureml.net/workspaces/a4feb6bbd48142d69a5a54df2bd448c8/services/618815772abb4c329d35c4c3b186a446/execute?api-version=2.0&details=true"

  def self.create_post(api_key, result_params)
    new(api_key, result_params).create_post
  end

  def initialize(api_key, result_params)
    @headers = {
      Authorization: "Bearer #{api_key}",
      content_type: :json,
      accept: :json
    }

    @result_params = result_params

    @default_body = {
                      Inputs: {
                        input1: {
                          ColumnNames: [],
                          Values: [[], []]
                        }
                      },
                    }
  end

  def create_post
    RestClient.post API_URI, result_params.to_json, @headers
  end

  private

    def result_params
      result = @default_body.dup
      @result_params.each do |column, value|
        result[:Inputs][:input1][:ColumnNames] << column
        result[:Inputs][:input1][:Values][0] << value
        result[:Inputs][:input1][:Values][1] << ''
      end
      result
    end
end
