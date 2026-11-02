package com.tgame.moudels.feilongtanyunshou.controller
{
   import com.tgame.moudels.feilongtanyunshou.model.FeiLongTanYunShou_MsgReceivedProxy;
   import com.tgame.moudels.feilongtanyunshou.model.FeiLongTanYunShou_MsgSenderProxy;
   import com.tgame.moudels.feilongtanyunshou.view.FeiLongTanYunShou_Mediator;
   import com.tgame.moudels.feilongtanyunshou.view.FeiLongTanYunShou_TargetPanelMediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class FeiLongTanYunShou_StartupCommand extends SimpleCommand
   {
      
      public function FeiLongTanYunShou_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new FeiLongTanYunShou_MsgReceivedProxy());
         facade.registerProxy(new FeiLongTanYunShou_MsgSenderProxy());
         facade.registerMediator(new FeiLongTanYunShou_Mediator());
         facade.registerMediator(new FeiLongTanYunShou_TargetPanelMediator());
      }
   }
}

