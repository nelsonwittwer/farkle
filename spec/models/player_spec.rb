require 'spec_helper'

describe Player do
	it { should respond_to(:games) }
	it { should respond_to(:name) }
end
