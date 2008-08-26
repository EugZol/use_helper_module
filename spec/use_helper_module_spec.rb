#!/usr/bin/env ruby

require File.dirname(__FILE__) + '/../lib/use_helper_module'

module MyHelperModule
  def my_helper_method
    :cool
  end
end

module SecondHelperModule
  def second_helper_method
    :right
  end
end

describe "use_helper_module" do
  before do
    @test_class = Class.new do
      extend UseHelperModule
      use_helper_module MyHelperModule, SecondHelperModule
    end
  end

  it "includes helper module to class" do
    @test_class.new.send(:my_helper_method).should == :cool
  end
  
  it "includes several modules to class" do
    @test_class.new.send(:second_helper_method).should == :right
  end
  
  it "makes included methods protected" do
    lambda{@test_class.new.my_helper_method}.should raise_error(NoMethodError)
  end
end
