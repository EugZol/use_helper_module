module UseHelperModule
  def use_helper_module(*consts)
    Array(consts).each do |const|
      @@base.send(:include, const)
      const.instance_methods.each do |meth|
        @@base.send(:protected, meth)
      end
    end
  end
  
  def self.extended(base)
    @@base = base
  end 
end
