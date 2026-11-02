package com.tgame.moudels.kuafuzhan.controller
{
   import com.tgame.common.GameInstance;
   import com.tgame.common.staticdata.NpcFunctionType;
   import com.tgame.manager.NoticeManager;
   import com.tgame.moudels.kuafuzhan.model.Kuafuzhan_MsgSenderProxy;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class Kuaifuzhan_ToKuafuLunjiantaiCommand extends SimpleCommand
   {
      
      public function Kuaifuzhan_ToKuafuLunjiantaiCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var _loc3_:Kuafuzhan_MsgSenderProxy = null;
         var _loc2_:int = Number(param1.getBody());
         if(_loc2_ == NpcFunctionType.TO_KUAFU_LUNJIANTAI)
         {
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,"正在准备传送...");
            _loc3_ = facade.retrieveProxy(Kuafuzhan_MsgSenderProxy.NAME) as Kuafuzhan_MsgSenderProxy;
            _loc3_.send_40211(GameInstance.lockOnChar.id);
         }
      }
   }
}

