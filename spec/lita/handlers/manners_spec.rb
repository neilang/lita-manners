require "spec_helper"

describe Lita::Handlers::Manners, lita_handler: true do
  let(:user) { Lita::User.create(1, name: 'You') }

  describe 'echo commands' do
    it { is_expected.to route_command('hello').to(:echo_command) }
    it { is_expected.to route_command('hi').to(:echo_command) }
    it { is_expected.to route_command('hey').to(:echo_command) }
    it { is_expected.to route_command('howdy').to(:echo_command) }
    it { is_expected.to route_command('goodbye').to(:echo_command) }
    it { is_expected.to route_command('bye').to(:echo_command) }
    it { is_expected.to route_command('morning').to(:echo_command) }
    it { is_expected.to route_command('good morning').to(:echo_command) }
    it { is_expected.to route_command('good night').to(:echo_command) }
    it { is_expected.to route_command('good afternoon').to(:echo_command) }
    it { is_expected.to route_command('good evening').to(:echo_command) }
    it { is_expected.to route_command('good night').to(:echo_command) }

    it { is_expected.to route_command('hello!').to(:echo_command) }
    it { is_expected.to route_command('hi!').to(:echo_command) }
    it { is_expected.to route_command('hey!').to(:echo_command) }
    it { is_expected.to route_command('howdy!').to(:echo_command) }
    it { is_expected.to route_command('goodbye!').to(:echo_command) }
    it { is_expected.to route_command('bye!').to(:echo_command) }
    it { is_expected.to route_command('morning!').to(:echo_command) }
    it { is_expected.to route_command('good morning!').to(:echo_command) }
    it { is_expected.to route_command('good night!').to(:echo_command) }
    it { is_expected.to route_command('good afternoon!').to(:echo_command) }
    it { is_expected.to route_command('good evening!').to(:echo_command) }
    it { is_expected.to route_command('good night!').to(:echo_command) }

    it 'replies with the user name' do
      send_command('Hello', as: user)
      expect(replies.last).to eq 'Hello You'
    end

    it 'replies without punctuation' do
      send_command('Hello!', as: user)
      expect(replies.last).to eq 'Hello You'
    end
  end

  describe 'echo messages' do
    it { is_expected.to route('hello lita').to(:echo_message) }
    it { is_expected.to route('hi lita').to(:echo_message) }
    it { is_expected.to route('hey lita').to(:echo_message) }
    it { is_expected.to route('howdy lita').to(:echo_message) }
    it { is_expected.to route('goodbye lita').to(:echo_message) }
    it { is_expected.to route('bye lita').to(:echo_message) }
    it { is_expected.to route('morning lita').to(:echo_message) }
    it { is_expected.to route('good morning lita').to(:echo_message) }
    it { is_expected.to route('good night lita').to(:echo_message) }
    it { is_expected.to route('good afternoon lita').to(:echo_message) }
    it { is_expected.to route('good evening lita').to(:echo_message) }
    it { is_expected.to route('good night lita').to(:echo_message) }

    it { is_expected.to route('hello @lita').to(:echo_message) }
    it { is_expected.to route('hi @lita').to(:echo_message) }
    it { is_expected.to route('hey @lita').to(:echo_message) }
    it { is_expected.to route('howdy @lita').to(:echo_message) }
    it { is_expected.to route('goodbye @lita').to(:echo_message) }
    it { is_expected.to route('bye @lita').to(:echo_message) }
    it { is_expected.to route('morning @lita').to(:echo_message) }
    it { is_expected.to route('good morning @lita').to(:echo_message) }
    it { is_expected.to route('good night @lita').to(:echo_message) }
    it { is_expected.to route('good afternoon @lita').to(:echo_message) }
    it { is_expected.to route('good evening @lita').to(:echo_message) }
    it { is_expected.to route('good night @lita').to(:echo_message) }

    it 'replies to Hello lita' do
      send_message('Hello lita', as: user)
      expect(replies.last).to eq 'Hello You'
    end

    it 'replies to Hello @lita' do
      send_message('Hello @lita', as: user)
      expect(replies.last).to eq 'Hello You'
    end

    it 'replies to Hello LITA' do
      send_message('Hello LITA', as: user)
      expect(replies.last).to eq 'Hello You'
    end

    it 'replies only to mentions' do
      send_message('Hello @someone', as: user)
      expect(replies.last).to eq nil
    end
  end

  describe 'thank you command' do
    it { is_expected.to route_command('thank you').to(:thank_you_command) }
    it { is_expected.to route_command('thankyou').to(:thank_you_command) }
    it { is_expected.to route_command('thanks').to(:thank_you_command) }
    it { is_expected.to route_command('cheers').to(:thank_you_command) }

    it { is_expected.to route_command('thank you!').to(:thank_you_command) }
    it { is_expected.to route_command('thankyou!').to(:thank_you_command) }
    it { is_expected.to route_command('thanks!').to(:thank_you_command) }
    it { is_expected.to route_command('cheers!').to(:thank_you_command) }

    it 'replies with the user name' do
      send_command('thank you', as: user)
      expect(replies.last).to eq 'You\'re welcome You'
    end
  end

  describe 'thank you message' do
    it { is_expected.to route('thank you lita').to(:thank_you_message) }
    it { is_expected.to route('thankyou lita').to(:thank_you_message) }
    it { is_expected.to route('thanks lita').to(:thank_you_message) }
    it { is_expected.to route('cheers lita').to(:thank_you_message) }

    it { is_expected.to route('thank you @lita').to(:thank_you_message) }
    it { is_expected.to route('thankyou @lita').to(:thank_you_message) }
    it { is_expected.to route('thanks @lita').to(:thank_you_message) }
    it { is_expected.to route('cheers @lita').to(:thank_you_message) }

    it 'replies to thank you lita' do
      send_message('thank you lita', as: user)
      expect(replies.last).to eq 'You\'re welcome You'
    end

    it 'replies to thank you @lita' do
      send_message('thank you @lita', as: user)
      expect(replies.last).to eq 'You\'re welcome You'
    end

    it 'replies to thank you LITA' do
      send_message('thank you LITA', as: user)
      expect(replies.last).to eq 'You\'re welcome You'
    end

    it 'replies only to mentions' do
      send_message('thank you @someone', as: user)
      expect(replies.last).to eq nil
    end
  end

  describe "sorry command" do
    it { is_expected.to route_command('sorry').to(:sorry_command) }
    it { is_expected.to route_command('I am sorry').to(:sorry_command) }
    it { is_expected.to route_command('I\'m sorry').to(:sorry_command) }

    it { is_expected.to route_command('sorry!').to(:sorry_command) }
    it { is_expected.to route_command('I am sorry!').to(:sorry_command) }
    it { is_expected.to route_command('I\'m sorry!').to(:sorry_command) }

    it 'replies with the user name' do
      send_command('sorry', as: user)
      expect(replies.last).to eq 'Apology accepted You'
    end
  end

  describe "sorry message" do
    it { is_expected.to route('sorry lita').to(:sorry_message) }
    it { is_expected.to route('I am sorry lita').to(:sorry_message) }
    it { is_expected.to route('I\'m sorry lita').to(:sorry_message) }

    it { is_expected.to route('sorry @lita').to(:sorry_message) }
    it { is_expected.to route('I am sorry @lita').to(:sorry_message) }
    it { is_expected.to route('I\'m sorry @lita').to(:sorry_message) }

    it 'replies to sorry lita' do
      send_message('sorry lita', as: user)
      expect(replies.last).to eq 'Apology accepted You'
    end

    it 'replies to sorry @lita' do
      send_message('sorry @lita', as: user)
      expect(replies.last).to eq 'Apology accepted You'
    end

    it 'replies to sorry LITA' do
      send_message('sorry LITA', as: user)
      expect(replies.last).to eq 'Apology accepted You'
    end

    it 'replies only to mentions' do
      send_message('sorry @someone', as: user)
      expect(replies.last).to eq nil
    end
  end
end
