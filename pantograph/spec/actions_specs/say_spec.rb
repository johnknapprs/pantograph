describe Pantograph do
  describe Pantograph::PantFile do
    describe "Say Integration" do
      describe "saying" do
        it "works with array" do
          expect(Pantograph::Actions).to receive(:sh)
            .with('say \'Hi Felix Good Job\'')
            .and_call_original

          result = Pantograph::PantFile.new.parse("lane :test do
            say(['Hi Felix', 'Good Job'])
          end").runner.execute(:test)

          expect(result).to eq('say \'Hi Felix Good Job\'')
        end

        it "works with string" do
          expect(Pantograph::Actions).to receive(:sh)
            .with('say \'Hi Josh Good Job\'')
            .and_call_original

          result = Pantograph::PantFile.new.parse("lane :test do
            say('Hi Josh Good Job')
          end").runner.execute(:test)

          expect(result).to eq('say \'Hi Josh Good Job\'')
        end

        it "works with options array" do
          expect(Pantograph::Actions).to receive(:sh)
            .with('say \'Hi Felix Good Job\'')
            .and_call_original

          result = Pantograph::PantFile.new.parse("lane :test do
            say(text: ['Hi Felix', 'Good Job'])
          end").runner.execute(:test)

          expect(result).to eq('say \'Hi Felix Good Job\'')
        end

        it "works with options string" do
          expect(Pantograph::Actions).to receive(:sh)
            .with('say \'Hi Josh Good Job\'')
            .and_call_original

          result = Pantograph::PantFile.new.parse("lane :test do
            say(text: 'Hi Josh Good Job')
          end").runner.execute(:test)

          expect(result).to eq('say \'Hi Josh Good Job\'')
        end
      end

      describe "muted" do
        before do
          stub_const('ENV', { 'SAY_MUTE' => 'true' })
        end

        it "works with array" do
          expect(Pantograph::UI).to receive(:message)
            .with('Hi Felix Good Job')
            .and_call_original

          result = Pantograph::PantFile.new.parse("lane :test do
            say(['Hi Felix', 'Good Job'])
          end").runner.execute(:test)

          expect(result).to eq('Hi Felix Good Job')
        end

        it "works with string" do
          expect(Pantograph::UI).to receive(:message)
            .with('Hi Josh Good Job')
            .and_call_original

          result = Pantograph::PantFile.new.parse("lane :test do
            say('Hi Josh Good Job')
          end").runner.execute(:test)

          expect(result).to eq('Hi Josh Good Job')
        end

        it "works with options array" do
          expect(Pantograph::UI).to receive(:message)
            .with('Hi Felix Good Job')
            .and_call_original

          result = Pantograph::PantFile.new.parse("lane :test do
            say(text: ['Hi Felix', 'Good Job'])
          end").runner.execute(:test)

          expect(result).to eq('Hi Felix Good Job')
        end

        it "works with options string" do
          expect(Pantograph::UI).to receive(:message)
            .with('Hi Josh Good Job')
            .and_call_original

          result = Pantograph::PantFile.new.parse("lane :test do
            say(text: 'Hi Josh Good Job')
          end").runner.execute(:test)

          expect(result).to eq('Hi Josh Good Job')
        end
      end
    end
  end
end
