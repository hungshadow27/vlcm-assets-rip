package com.tgame.moudels.banghui.controller
{
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.staticdata.NpcFunctionType;
   import com.tgame.manager.NoticeManager;
   import com.tgame.moudels.banghui.model.Banghui_MsgSenderProxy;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class Banghui_ToCanglongtanCommand extends SimpleCommand
   {
      
      public function Banghui_ToCanglongtanCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc3_:Banghui_MsgSenderProxy = null;
         var _loc2_:int = Number(param1.getBody());
         if(_loc2_ == NpcFunctionType.TO_CANGLONGTAN)
         {
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"正在准备传送"),false);
            _loc3_ = facade.retrieveProxy(Banghui_MsgSenderProxy.NAME) as Banghui_MsgSenderProxy;
            _loc3_.send_51133(GameInstance.lockOnChar.id);
         }
         else if(_loc2_ == NpcFunctionType.TO_LUNJIANTAI)
         {
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,LanResManager.getLanTextWords(this,"正在准备传送"),false);
            _loc3_ = facade.retrieveProxy(Banghui_MsgSenderProxy.NAME) as Banghui_MsgSenderProxy;
            _loc3_.send_51135(GameInstance.lockOnChar.id);
         }
      }
   }
}

