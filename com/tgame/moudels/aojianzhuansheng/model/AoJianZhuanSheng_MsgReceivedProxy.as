package com.tgame.moudels.aojianzhuansheng.model
{
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.ResPathManager;
   import com.tgame.common.staticdata.OtherConst;
   import com.tgame.manager.NetWorkManager;
   import com.tgame.moudels.aojianzhuansheng.view.AoJianZhuanSheng_Mediator;
   import com.zcp.common.log.ZLog;
   import com.zcp.common.observer.Notification;
   import com.zcp.engine.SceneCharacter;
   import com.zcp.engine.staticdata.AvatarPartType;
   import com.zcp.engine.vo.avatar.AvatarParamData;
   import flash.utils.ByteArray;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class AoJianZhuanSheng_MsgReceivedProxy extends Proxy
   {
      
      public static const NAME:String = "AoJianZhuanSheng_MsgReceivedProxy";
      
      private var _mianPanelMediator:AoJianZhuanSheng_Mediator;
      
      public function AoJianZhuanSheng_MsgReceivedProxy(param1:String = null, param2:Object = null)
      {
         super(NAME,null);
      }
      
      public function get mianPanelMediator() : AoJianZhuanSheng_Mediator
      {
         if(!this._mianPanelMediator)
         {
            this._mianPanelMediator = facade.retrieveMediator(AoJianZhuanSheng_Mediator.NAME) as AoJianZhuanSheng_Mediator;
         }
         return this._mianPanelMediator;
      }
      
      override public function onRegister() : void
      {
         NetWorkManager.registerMsgs([80192],this.receivedMsgHandle,NAME);
      }
      
      override public function onRemove() : void
      {
         NetWorkManager.removeMsgs([80192],NAME);
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
      
      public function received_80192(param1:ByteArray) : void
      {
         var _loc14_:SceneCharacter = null;
         var _loc15_:AvatarParamData = null;
         ZLog.add("80192：返回玩家傲剑转生详细数据");
         var _loc2_:String = param1.readUTF();
         var _loc3_:int = param1.readInt();
         var _loc4_:Number = param1.readDouble();
         var _loc5_:Boolean = Boolean(param1.readByte());
         var _loc6_:int = param1.readInt();
         var _loc7_:int = param1.readInt();
         var _loc8_:int = param1.readInt();
         var _loc9_:int = param1.readInt();
         var _loc10_:int = param1.readInt();
         var _loc11_:int = param1.readInt();
         var _loc12_:int = param1.readByte();
         var _loc13_:int = param1.readInt();
         GameInstance.mainCharData.isZhuanSheng = Boolean(param1.readByte());
         if(_loc7_ > 0 && !GameInstance.mainCharData.attributeInfo.isShowNeiGong)
         {
            _loc14_ = GameInstance.scene.getCharByID(GameInstance.mainChar.id,1);
            _loc15_ = new AvatarParamData(ResPathManager.getAvatarPath_Others(ResPathManager["AVATAR_ZHUANSHENG_" + _loc7_]),AvatarPartType.MAGIC_RING);
            _loc15_.id = "zhuansheng_lv";
            _loc15_.depth = OtherConst.SILINGZHEN_DEPTH;
            _loc14_.loadAvatarPart(_loc15_);
         }
         else
         {
            _loc14_ = GameInstance.scene.getCharByID(GameInstance.mainChar.id,1);
            _loc14_.removeAvatarPartByID("zhuansheng_lv");
         }
         this.mianPanelMediator.setPanel(_loc2_,_loc3_,_loc4_,_loc5_,_loc6_,_loc7_,_loc8_,_loc9_,_loc10_,_loc11_,_loc12_,_loc13_);
      }
   }
}

