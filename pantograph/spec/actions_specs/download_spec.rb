describe Pantograph do
  describe Pantograph::PantFile do
    describe "download" do
      before do
        stub_request(:get, "https://google.com/remoteFile.json").
          to_return(status: 200, body: { status: :ok }.to_json, headers: {})

        stub_request(:get, "https://google.com/timeout.json").to_timeout
      end

      it "downloads the file from a remote server" do
        url = "https://google.com/remoteFile.json"
        result = Pantograph::PantFile.new.parse("lane :test do
          download(url: '#{url}')
        end").runner.execute(:test)

        correct = { 'status' => 'ok' }
        expect(result).to eq(correct)
        expect(Pantograph::Actions.lane_context[Pantograph::Actions::SharedValues::DOWNLOAD_CONTENT]).to eq(correct)
      end

      it "properly handles network failures" do
        expect do
          url = "https://google.com/timeout.json"
          result = Pantograph::PantFile.new.parse("lane :test do
            download(url: '#{url}')
          end").runner.execute(:test)
        end.to raise_error("Error fetching remote file: execution expired")
      end
    end
  end
end
