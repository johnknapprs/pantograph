Pantograph.load_actions

def before_each_pantograph
  Pantograph::Actions.clear_lane_context
end

def stub_plugin_exists_on_rubygems(plugin_name, exists)
  stub_request(:get, "https://rubygems.org/api/v1/gems/pantograph-plugin-#{plugin_name}.json").
    with(headers: { 'Accept' => '*/*', 'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent' => 'Ruby' }).
    to_return(status: 200, body: (exists ? { version: "1.0" }.to_json : nil), headers: {})
end
