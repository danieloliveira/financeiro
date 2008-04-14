require File.dirname(__FILE__) + '/../spec_helper'

describe ExemplosController do
  describe "route generation" do

    it "should map { :controller => 'exemplos', :action => 'index' } to /exemplos" do
      route_for(:controller => "exemplos", :action => "index").should == "/exemplos"
    end
  
    it "should map { :controller => 'exemplos', :action => 'new' } to /exemplos/new" do
      route_for(:controller => "exemplos", :action => "new").should == "/exemplos/new"
    end
  
    it "should map { :controller => 'exemplos', :action => 'show', :id => 1 } to /exemplos/1" do
      route_for(:controller => "exemplos", :action => "show", :id => 1).should == "/exemplos/1"
    end
  
    it "should map { :controller => 'exemplos', :action => 'edit', :id => 1 } to /exemplos/1/edit" do
      route_for(:controller => "exemplos", :action => "edit", :id => 1).should == "/exemplos/1/edit"
    end
  
    it "should map { :controller => 'exemplos', :action => 'update', :id => 1} to /exemplos/1" do
      route_for(:controller => "exemplos", :action => "update", :id => 1).should == "/exemplos/1"
    end
  
    it "should map { :controller => 'exemplos', :action => 'destroy', :id => 1} to /exemplos/1" do
      route_for(:controller => "exemplos", :action => "destroy", :id => 1).should == "/exemplos/1"
    end
  end

  describe "route recognition" do

    it "should generate params { :controller => 'exemplos', action => 'index' } from GET /exemplos" do
      params_from(:get, "/exemplos").should == {:controller => "exemplos", :action => "index"}
    end
  
    it "should generate params { :controller => 'exemplos', action => 'new' } from GET /exemplos/new" do
      params_from(:get, "/exemplos/new").should == {:controller => "exemplos", :action => "new"}
    end
  
    it "should generate params { :controller => 'exemplos', action => 'create' } from POST /exemplos" do
      params_from(:post, "/exemplos").should == {:controller => "exemplos", :action => "create"}
    end
  
    it "should generate params { :controller => 'exemplos', action => 'show', id => '1' } from GET /exemplos/1" do
      params_from(:get, "/exemplos/1").should == {:controller => "exemplos", :action => "show", :id => "1"}
    end
  
    it "should generate params { :controller => 'exemplos', action => 'edit', id => '1' } from GET /exemplos/1;edit" do
      params_from(:get, "/exemplos/1/edit").should == {:controller => "exemplos", :action => "edit", :id => "1"}
    end
  
    it "should generate params { :controller => 'exemplos', action => 'update', id => '1' } from PUT /exemplos/1" do
      params_from(:put, "/exemplos/1").should == {:controller => "exemplos", :action => "update", :id => "1"}
    end
  
    it "should generate params { :controller => 'exemplos', action => 'destroy', id => '1' } from DELETE /exemplos/1" do
      params_from(:delete, "/exemplos/1").should == {:controller => "exemplos", :action => "destroy", :id => "1"}
    end
  end
end