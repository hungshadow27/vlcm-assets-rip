package com.tgame.moudels.shibatongren.controller
{
   import com.tgame.moudels.shibatongren.model.ShiBaTongRen_MsgReceivedProxy;
   import com.tgame.moudels.shibatongren.model.ShiBaTongRen_MsgSenderProxy;
   import com.tgame.moudels.shibatongren.view.ShiBatongren_ChuangguanPanelMediator;
   import com.tgame.moudels.shibatongren.view.ShiBatongren_PanelMediator;
   import com.tgame.moudels.shibatongren.view.ShiBatongren_TargetPanelMediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class ShiBatongren_StartupCommand extends SimpleCommand
   {
      
      public function ShiBatongren_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new ShiBaTongRen_MsgReceivedProxy());
         facade.registerProxy(new ShiBaTongRen_MsgSenderProxy());
         facade.registerMediator(new ShiBatongren_PanelMediator());
         facade.registerMediator(new ShiBatongren_TargetPanelMediator());
         facade.registerMediator(new ShiBatongren_ChuangguanPanelMediator());
      }
   }
}

