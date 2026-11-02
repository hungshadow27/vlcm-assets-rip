package com.tgame.moudels.sanshiliushou.controller
{
   import com.tgame.moudels.sanshiliushou.model.SanShiLiuShou_MsgReceivedProxy;
   import com.tgame.moudels.sanshiliushou.model.SanShiLiuShou_MsgSenderProxy;
   import com.tgame.moudels.sanshiliushou.view.SanShiLiuShou_MaincharPlaneMediator;
   import com.tgame.moudels.sanshiliushou.view.SanShiLiuShou_TargetCharPlaneMediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class SanShiLiuShou_StartupCommand extends SimpleCommand
   {
      
      public function SanShiLiuShou_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new SanShiLiuShou_MsgReceivedProxy());
         facade.registerProxy(new SanShiLiuShou_MsgSenderProxy());
         facade.registerMediator(new SanShiLiuShou_MaincharPlaneMediator());
         facade.registerMediator(new SanShiLiuShou_TargetCharPlaneMediator());
      }
   }
}

