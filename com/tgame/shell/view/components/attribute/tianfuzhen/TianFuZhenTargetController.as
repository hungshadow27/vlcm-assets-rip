package com.tgame.shell.view.components.attribute.tianfuzhen
{
   import com.tgame.moudels.tianfuzhen.model.info.TianFuZhenVO;
   import com.tgame.shell.view.components.TargetAttribute;
   
   public class TianFuZhenTargetController
   {
      
      private static var _instance:TianFuZhenTargetController;
      
      private var _targetAttribute:TargetAttribute;
      
      private var _tianFuZhen:TianFuZhen;
      
      public function TianFuZhenTargetController()
      {
         super();
      }
      
      public static function get instance() : TianFuZhenTargetController
      {
         if(!_instance)
         {
            _instance = new TianFuZhenTargetController();
         }
         return _instance;
      }
      
      public function TianFuZhenController() : *
      {
      }
      
      public function setup(param1:TargetAttribute, param2:TianFuZhen) : void
      {
         this._targetAttribute = param1;
         this._tianFuZhen = param2;
      }
      
      public function showTianFuZhen() : void
      {
         this._targetAttribute.initCharPanel(4,"21");
      }
      
      public function setTianFuZhenInitialize(param1:TianFuZhenVO) : void
      {
         this._tianFuZhen.setInitialize(param1);
      }
      
      public function setTianFuZhenEnableFun() : void
      {
         this._tianFuZhen.setEnableFun();
      }
      
      public function setTianFuZhenPingBi(param1:Boolean) : void
      {
         this._tianFuZhen.setXianShi(param1);
      }
      
      public function setTianFuJiHuo(param1:Boolean) : void
      {
         this._tianFuZhen.setJiHuo(param1);
      }
   }
}

