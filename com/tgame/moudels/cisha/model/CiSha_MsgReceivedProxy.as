package com.tgame.moudels.cisha.model
{
   import com.tgame.common.vo.item.Goods;
   import com.tgame.common.vo.item.MallGoods;
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.cisha.view.CishaJiangMiLingDan_Mediator;
   import com.tgame.moudels.cisha.view.CishaJiangliLingqu_Mediator;
   import com.tgame.moudels.cisha.view.DiXiaQianZhuang_Mediator;
   import com.tgame.moudels.cisha.view.FuChouOKPanel_Mediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class CiSha_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "CiSha_MsgReceivedProxy";
      
      private var _fuChouOKPanel_Mediator:FuChouOKPanel_Mediator;
      
      private var _ciShaOKPanel_Mediator:CishaJiangliLingqu_Mediator;
      
      private var _dixiaQianZhuangPanel_Mediator:DiXiaQianZhuang_Mediator;
      
      private var _ciShaMilingPanel_Mediator:CishaJiangMiLingDan_Mediator;
      
      public function CiSha_MsgReceivedProxy()
      {
         super(NAME,null);
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([57452,57412,57420],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([57452,57412,57420],NAME);
      }
      
      private function get fuChouOKPanel_Mediator() : FuChouOKPanel_Mediator
      {
         if(this._fuChouOKPanel_Mediator == null)
         {
            this._fuChouOKPanel_Mediator = facade.retrieveMediator(FuChouOKPanel_Mediator.NAME) as FuChouOKPanel_Mediator;
         }
         return this._fuChouOKPanel_Mediator;
      }
      
      private function get ciShaOKPanel_Mediator() : CishaJiangliLingqu_Mediator
      {
         if(this._ciShaOKPanel_Mediator == null)
         {
            this._ciShaOKPanel_Mediator = facade.retrieveMediator(CishaJiangliLingqu_Mediator.NAME) as CishaJiangliLingqu_Mediator;
         }
         return this._ciShaOKPanel_Mediator;
      }
      
      private function get dixiaQianZhuang_Mediator() : DiXiaQianZhuang_Mediator
      {
         if(this._dixiaQianZhuangPanel_Mediator == null)
         {
            this._dixiaQianZhuangPanel_Mediator = facade.retrieveMediator(DiXiaQianZhuang_Mediator.NAME) as DiXiaQianZhuang_Mediator;
         }
         return this._dixiaQianZhuangPanel_Mediator;
      }
      
      private function get ciShaMilingPanel_Mediator() : CishaJiangMiLingDan_Mediator
      {
         if(this._ciShaMilingPanel_Mediator == null)
         {
            this._ciShaMilingPanel_Mediator = facade.retrieveMediator(CishaJiangMiLingDan_Mediator.NAME) as CishaJiangMiLingDan_Mediator;
         }
         return this._ciShaMilingPanel_Mediator;
      }
      
      private function receivedMsgHandle(param1:Notification) : void
      {
         var _loc2_:* = param1.name;
         var _loc3_:ByteArray = param1.body as ByteArray;
         if(this.hasOwnProperty("received_" + _loc2_))
         {
            this["received_" + _loc2_](_loc3_);
         }
         else
         {
            ZLog.add("协议号 " + _loc2_ + "不存在");
         }
      }
      
      public function received_57452(param1:ByteArray) : void
      {
         var _loc3_:int = 0;
         var _loc4_:Array = null;
         var _loc5_:Array = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:Array = null;
         var _loc9_:Goods = null;
         var _loc10_:Object = null;
         ZLog.add("57452：刺杀成功/复仇成功面板信息");
         var _loc2_:int = param1.readByte();
         if(_loc2_ == 0)
         {
            _loc3_ = param1.readInt();
            this.ciShaOKPanel_Mediator.setNum(_loc3_);
         }
         else if(_loc2_ == 1)
         {
            _loc4_ = param1.readUTF().split(";");
            _loc5_ = [];
            _loc7_ = int(_loc4_.length);
            _loc8_ = [];
            _loc6_ = 0;
            while(_loc6_ < _loc7_)
            {
               if(_loc4_[_loc6_] != "")
               {
                  _loc10_ = {};
                  _loc8_ = _loc4_[_loc6_].split(",");
                  _loc10_.id = int(_loc8_[0]);
                  _loc9_ = new Goods(int(_loc8_[1]));
                  _loc9_.count = int(_loc8_[2]);
                  _loc10_.good = _loc9_;
                  _loc5_.push(_loc10_);
               }
               _loc6_++;
            }
            this.fuChouOKPanel_Mediator.refreshPanel(_loc5_);
         }
      }
      
      public function received_57412(param1:ByteArray) : void
      {
         ZLog.add("57412：刺杀密令面板信息返回");
         var _loc2_:String = param1.readUTF();
         var _loc3_:int = param1.readInt();
         var _loc4_:String = param1.readUTF();
         var _loc5_:int = param1.readInt();
         var _loc6_:String = param1.readUTF();
         var _loc7_:String = param1.readUTF();
         var _loc8_:int = param1.readShort();
         var _loc9_:int = param1.readShort();
         this.ciShaMilingPanel_Mediator.setCishaMilingPanelNum(_loc2_,_loc3_,_loc4_,_loc5_,_loc6_,_loc7_,_loc8_,_loc9_);
      }
      
      public function received_57420(param1:ByteArray) : void
      {
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:MallGoods = null;
         var _loc2_:ByteArray = param1;
         var _loc3_:int = _loc2_.readByte();
         var _loc4_:int = _loc2_.readInt();
         var _loc5_:int = _loc2_.readByte();
         ZLog.add("57420：接收  地下钱庄信息 数量=" + _loc5_);
         var _loc6_:Array = new Array();
         var _loc7_:int = 0;
         while(_loc7_ < _loc5_)
         {
            _loc8_ = _loc2_.readInt();
            _loc9_ = _loc2_.readInt();
            _loc10_ = new MallGoods(_loc8_,_loc9_);
            _loc10_.f_goods_price = _loc2_.readInt();
            _loc10_.f_goods_price_org = _loc2_.readInt();
            _loc10_.f_hot_mark = _loc2_.readByte();
            _loc10_.f_abate_mark = _loc2_.readByte();
            _loc6_.push(_loc10_);
            _loc7_++;
         }
         this.dixiaQianZhuang_Mediator.updateMallPanel(_loc3_,_loc4_,_loc6_);
      }
      
      public function received_57422(param1:ByteArray) : void
      {
         var _loc2_:ByteArray = param1;
         ZLog.add("57422：地下钱庄兑换结果");
      }
   }
}

