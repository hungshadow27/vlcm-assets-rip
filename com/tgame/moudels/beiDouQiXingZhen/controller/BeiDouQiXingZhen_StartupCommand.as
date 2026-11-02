package com.tgame.moudels.beiDouQiXingZhen.controller
{
   import com.tgame.moudels.beiDouQiXingZhen.model.BeiDouQiXingZhen_MsgReceivedProxy;
   import com.tgame.moudels.beiDouQiXingZhen.model.BeiDouQiXingZhen_MsgSenderProxy;
   import com.tgame.moudels.beiDouQiXingZhen.veiw.BeiDouQiXingZhen_Mediator;
   import com.tgame.moudels.beiDouQiXingZhen.veiw.BeiDouQiXingZhen_TargetPanelMediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class BeiDouQiXingZhen_StartupCommand extends SimpleCommand
   {
      
      public function BeiDouQiXingZhen_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new BeiDouQiXingZhen_MsgReceivedProxy());
         facade.registerProxy(new BeiDouQiXingZhen_MsgSenderProxy());
         facade.registerMediator(new BeiDouQiXingZhen_Mediator());
         facade.registerMediator(new BeiDouQiXingZhen_TargetPanelMediator());
      }
   }
}

