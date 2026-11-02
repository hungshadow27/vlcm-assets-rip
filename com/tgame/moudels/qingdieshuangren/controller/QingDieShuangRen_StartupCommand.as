package com.tgame.moudels.qingdieshuangren.controller
{
   import com.tgame.moudels.qingdieshuangren.model.QingDieShuangRen_MsgReceivedProxy;
   import com.tgame.moudels.qingdieshuangren.model.QingDieShuangRen_MsgSenderProxy;
   import com.tgame.moudels.qingdieshuangren.view.QingDieShuangRen_Mediator;
   import com.tgame.moudels.qingdieshuangren.view.QingDieShuangRen_TargetPanelMediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class QingDieShuangRen_StartupCommand extends SimpleCommand
   {
      
      public function QingDieShuangRen_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new QingDieShuangRen_MsgReceivedProxy());
         facade.registerProxy(new QingDieShuangRen_MsgSenderProxy());
         facade.registerMediator(new QingDieShuangRen_Mediator());
         facade.registerMediator(new QingDieShuangRen_TargetPanelMediator());
      }
   }
}

