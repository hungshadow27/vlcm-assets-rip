package com.tgame.moudels.jinzhongzhao.controller
{
   import com.tgame.moudels.jinzhongzhao.model.Jinzhongzhao_MsgReceivedProxy;
   import com.tgame.moudels.jinzhongzhao.model.Jinzhongzhao_MsgSenderProxy;
   import com.tgame.moudels.jinzhongzhao.view.Jinzhongzhao_ChuangguanPanelMediator;
   import com.tgame.moudels.jinzhongzhao.view.Jinzhongzhao_PanelMediator;
   import com.tgame.moudels.jinzhongzhao.view.Jinzhongzhao_TargetPanelMediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class Jinzhongzhao_StartupCommand extends SimpleCommand
   {
      
      public function Jinzhongzhao_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new Jinzhongzhao_MsgReceivedProxy());
         facade.registerProxy(new Jinzhongzhao_MsgSenderProxy());
         facade.registerMediator(new Jinzhongzhao_PanelMediator());
         facade.registerMediator(new Jinzhongzhao_TargetPanelMediator());
         facade.registerMediator(new Jinzhongzhao_ChuangguanPanelMediator());
      }
   }
}

