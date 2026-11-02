package com.tgame.shell.view.components.attribute.niaoxiangzhen
{
   import com.tgame.moudels.niaoxiangzhen.model.info.NiaoXiangZhenVO;
   import com.tgame.shell.view.components.TargetAttribute;
   
   public class NiaoXiangZhenTargetController
   {
      
      private static var _instance:NiaoXiangZhenTargetController;
      
      private var _charAttribute:TargetAttribute;
      
      private var _niaoXiangZhen:NiaoXiangZhen;
      
      public function NiaoXiangZhenTargetController()
      {
         super();
      }
      
      public static function get instance() : NiaoXiangZhenTargetController
      {
         if(!_instance)
         {
            _instance = new NiaoXiangZhenTargetController();
         }
         return _instance;
      }
      
      public function TianFuZhenController() : *
      {
      }
      
      public function setup(param1:TargetAttribute, param2:NiaoXiangZhen) : void
      {
         this._charAttribute = param1;
         this._niaoXiangZhen = param2;
      }
      
      public function showTianFuZhen() : void
      {
         this._charAttribute.initCharPanel(4,"22");
      }
      
      public function setTianFuZhenInitialize(param1:NiaoXiangZhenVO) : void
      {
         this._niaoXiangZhen.setInitialize(false,param1);
      }
      
      public function setTianFuZhenEnableFun() : void
      {
         this._niaoXiangZhen.setEnableFun();
      }
      
      public function setTianFuZhenPingBi(param1:Boolean) : void
      {
         this._niaoXiangZhen.setXianShi(param1);
      }
      
      public function setTianFuJiHuo(param1:Boolean) : void
      {
         this._niaoXiangZhen.setJiHuo(param1);
      }
   }
}

