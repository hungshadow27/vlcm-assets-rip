package com.tgame.moudels.newPlayerGuide.model
{
   import com.tgame.common.GameInstance;
   import com.tgame.common.staticdata.NewPlayerGuideStaticFun;
   import com.tgame.common.staticdata.NewPlayerGuideType;
   import com.tgame.common.vo.character.info.GoodsInfo;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.NetWorkManager;
   import com.tgame.shell.view.components.MainUI;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import com.zcp.common.utils.Fun;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class NewPlayerGuide_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "NewPlayerGuide_MsgReceivedProxy";
      
      public function NewPlayerGuide_MsgReceivedProxy(param1:String = null, param2:Object = null)
      {
         super(NAME,param2);
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([50652,50666,50668,50670,50672,50674,50676,50678,50680,50684],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([50652,50666,50668,50670,50672,50674,50676,50678,50680,50684],NAME);
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
            ZLog.add("协议号" + _loc2_ + "不存在");
         }
      }
      
      public function received_50652(param1:ByteArray) : void
      {
         var _loc4_:int = 0;
         var _loc5_:Boolean = false;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         ZLog.add("50652：返回所有新手引导id组");
         var _loc2_:int = param1.readByte();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = param1.readByte();
            _loc5_ = param1.readByte() == 0 ? false : true;
            _loc6_ = param1.readByte();
            _loc7_ = param1.readByte();
            NewPlayerGuideStaticFun.setNewPlayerGuideObj(_loc4_,_loc5_,_loc7_,_loc6_);
            _loc3_++;
         }
         NewPlayerGuideStaticFun.isReceived50652 = true;
         if(NewPlayerGuideStaticFun.waitAddAndShowOneNewPlayerGuideArr.length > 0)
         {
            _loc3_ = 0;
            while(_loc3_ < NewPlayerGuideStaticFun.waitAddAndShowOneNewPlayerGuideArr.length)
            {
               NewPlayerGuideStaticFun.addAndShowOneNewPlayerGuide(NewPlayerGuideStaticFun.waitAddAndShowOneNewPlayerGuideArr[_loc3_]);
               _loc3_++;
            }
         }
      }
      
      public function received_50666(param1:ByteArray) : void
      {
         var _loc7_:Goods = null;
         ZLog.add("50666：第一次获得装备类的任务物品奖励");
         var _loc2_:int = param1.readShort();
         var _loc3_:int = param1.readShort();
         var _loc4_:int = param1.readInt();
         var _loc5_:int = param1.readInt();
         var _loc6_:GoodsInfo = GameInstance.mainCharData.goodsInfo;
         _loc7_ = _loc6_.getGoodsByPosition(_loc2_);
         NewPlayerGuideStaticFun.guide9Goods = _loc7_;
         NewPlayerGuideStaticFun.addAndShowOneNewPlayerGuide(NewPlayerGuideType.Guide9);
         if(Fun.isVisible(GameInstance.uiInstance._backpack))
         {
            NewPlayerGuideStaticFun.closeNewPlayerGuide(NewPlayerGuideType.Guide9);
            NewPlayerGuideStaticFun.addAndShowOneNewPlayerGuide(NewPlayerGuideType.Guide10);
         }
         NewPlayerGuideStaticFun.addImageInstanceGuide(MainUI.IMAGE_LEAD_TYPE_TASK_PRIZE_EQUIP,{
            "str":"",
            "goods":_loc7_
         });
      }
      
      public function received_50668(param1:ByteArray) : void
      {
         ZLog.add("50668：装备比较好且符合条件时弹图标式新手引导");
         var _loc2_:int = param1.readShort();
         var _loc3_:Goods = GameInstance.mainCharData.goodsInfo.getGoodsByPosition(_loc2_);
         if(_loc3_)
         {
            NewPlayerGuideStaticFun.addImageInstanceGuide(MainUI.IMAGE_LEAD_TYPE_NEW_GOOD_EQUIP,{
               "str":"",
               "goods":_loc3_
            });
         }
      }
      
      public function received_50670(param1:ByteArray) : void
      {
         ZLog.add("50670：技能书入手且符合条件时弹图标式新手引导");
         var _loc2_:int = param1.readShort();
         var _loc3_:Goods = GameInstance.mainCharData.goodsInfo.getGoodsByPosition(_loc2_);
         NewPlayerGuideStaticFun.addImageInstanceGuide(MainUI.IMAGE_LEAD_TYPE_KUNGFU_BOOK,_loc3_);
      }
      
      public function received_50672(param1:ByteArray) : void
      {
         ZLog.add("50672：打怪爆出东西");
         NewPlayerGuideStaticFun.addImageInstanceGuide(MainUI.IMAGE_LEAD_TYPE_GET_ITEM_FLOOR);
      }
      
      public function received_50674(param1:ByteArray) : void
      {
         ZLog.add("50674：打怪爆出东西");
         NewPlayerGuideStaticFun.addImageInstanceGuide(MainUI.IMAGE_LEAD_TYPE_BIGUAN_TIME_TO_12_HORSE_FLOOR);
      }
      
      public function received_50676(param1:ByteArray) : void
      {
         ZLog.add("50676：升级提示");
         var _loc2_:String = param1.readUTF();
      }
      
      public function received_50678(param1:ByteArray) : void
      {
         ZLog.add("50678：侠客岛开放等可配置的新手引导");
         var _loc2_:String = param1.readUTF();
         var _loc3_:String = param1.readUTF();
         var _loc4_:String = param1.readUTF();
         NewPlayerGuideStaticFun.addImageInstanceGuide(MainUI.IMAGE_LEAD_TYPE_XIAKEDAO_MAP_OPEN,{
            "name":_loc2_,
            "str":_loc3_,
            "_goto":_loc4_
         });
      }
      
      public function received_50680(param1:ByteArray) : void
      {
         ZLog.add("50680：登陆有未领取的跨服战奖励");
         NewPlayerGuideStaticFun.addImageInstanceGuide(MainUI.IMAGE_LEAD_TYPE_GET_LUNJIANTAI_GIFT);
      }
      
      public function received_50682(param1:ByteArray) : void
      {
         ZLog.add("50682：跨服战开启");
         NewPlayerGuideStaticFun.addImageInstanceGuide(MainUI.IMAGE_LEAD_TYPE_LUNJIANTAI_START);
      }
      
      public function received_50684(param1:ByteArray) : void
      {
         ZLog.add("50684：领取帝王黄气新手引导");
         var _loc2_:String = param1.readUTF();
         var _loc3_:String = param1.readUTF();
         var _loc4_:String = param1.readUTF();
         NewPlayerGuideStaticFun.addImageInstanceGuide(MainUI.IMAGE_LEAD_TYPE_DIWANGHUANGQI,{
            "name":_loc2_,
            "str":_loc3_,
            "goto":_loc4_
         });
      }
   }
}

