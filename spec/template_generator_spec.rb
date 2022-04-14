require 'pry'
require './lib/template_generator' 

describe TemplateGenerator do
  describe "#create templates" do
    it "create template with clause id 1" do
      expect do
        TemplateGenerator.new.create([1])
      end.to output("A T&C Document\n\nThis document is made of plaintext.\nIs made of The quick brown fox.\n\nYour legals.\n").to_stdout
    end

    it "create template with clause ids 1,3" do
      expect do
        TemplateGenerator.new.create([1, 3])
      end.to output("A T&C Document\n\nThis document is made of plaintext.\nIs made of The quick brown fox.\nIs made of And dies.\n\nYour legals.\n").to_stdout
    end

    it "create template with clause ids 3,4 and section id 1" do
      expect do
        TemplateGenerator.new.create([1, 3], [1])
      end.to output("A T&C Document\n\nThis document is made of plaintext.\nIs made of The quick brown fox.\nIs made of And dies.\nIs made of The quick brown fox;jumps over the lazy dog.\n\nYour legals.\n").to_stdout
    end
  end
end
