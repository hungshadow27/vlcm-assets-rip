package com.tgame.shell.view.components.attribute.tianfuzhen
{
   import com.tgame.common.vo.item.Goods;
   import com.tgame.moudels.tianfuzhen.model.info.TianFuZhenVO;
   import com.tgame.shell.view.components.CharAttribute;
   import com.zcp.common.events.BaseEvent;
   
   public class TianFuZhenController
   {
      
      private static var _instance:TianFuZhenController;
      
      private var _attribute:CharAttribute;
      
      private var _tianFuZhen:TianFuZhen;
      
      public function TianFuZhenController()
      {
         super();
      }
      
      public static function get instance() : TianFuZhenController
      {
         if(!_instance)
         {
            _instance = new TianFuZhenController();
         }
         return _instance;
      }
      
      public function setup(param1:CharAttribute, param2:TianFuZhen) : void
      {
         this._attribute = param1;
         this._tianFuZhen = param2;
      }
      
      public function requestShowTianFuZhen() : void
      {
         this._attribute.dispatchEvent(new BaseEvent(TianFuZhenConst.TIANFUZHEN));
      }
      
      public function showTianFuZhen() : void
      {
         this._attribute.initCharPanel(4,"21");
      }
      
      public function setTianFuZhenInitialize(param1:TianFuZhenVO) : void
      {
         this._tianFuZhen.setInitialize(param1);
      }
      
      public function setTianFuJiHuo(param1:Boolean) : void
      {
         this._tianFuZhen.setJiHuo(param1);
      }
      
      public function setTianFuZhenLingwuInitialize(param1:String, param2:Boolean, param3:String, param4:int, param5:Boolean, param6:int, param7:int, param8:int) : void
      {
         this._tianFuZhen.setTupoInit(param1,param2,param3,param4,param5,param6,param7,param8);
      }
      
      public function setTianFuZhenLingwuZhufuzhi(param1:int, param2:int, param3:int = 0) : void
      {
         this._tianFuZhen.setZhufuzhi(param1,param2,param3);
      }
      
      public function setTianFuZhenLingwuGoods(param1:Goods, param2:Boolean) : void
      {
         this._tianFuZhen.setGoods(param1,param2);
      }
      
      public function setTianFuZhenLingwuBtn(param1:Boolean) : void
      {
         this._tianFuZhen.setTuPoBtn(param1);
      }
      
      public function showTianFuZhenLingWuPanel(param1:Boolean) : void
      {
         this._tianFuZhen.showTuPoPanel(param1);
      }
      
      public function isTianFuZhentupoCanvasShow() : Boolean
      {
         return this._tianFuZhen.isTupoCanvasShow();
      }
   }
}

