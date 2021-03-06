describe Pantograph do
  describe Pantograph::PantFile do
    describe "Git Pull Action" do
      it "runs git pull" do
        result = Pantograph::PantFile.new.parse("lane :test do
            git_pull
          end").runner.execute(:test)

        expect(result).to eq('git pull')
      end
    end
  end
end
