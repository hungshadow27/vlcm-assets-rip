package com.tgame.moudels.attribute.controller
{
   import com.tgame.moudels.attribute.model.Attribute_MsgReceivedProxy;
   import com.tgame.moudels.attribute.model.Attribute_MsgSenderProxy;
   import com.tgame.moudels.attribute.view.Attribute_MainCharAttributePlaneMediator;
   import com.tgame.moudels.attribute.view.Attribute_TaJingmaiPanelMediator;
   import com.tgame.moudels.attribute.view.Attribute_TargetCharAttributePlaneMediator;
   import com.tgame.moudels.attribute.view.XunzhangMediator;
   import com.tgame.moudels.attribute.view.Xunzhang_TargetMediator;
   import com.tgame.moudels.attribute.view.ZhanQi_Mediator;
   import com.tgame.moudels.attribute.view.ZhanQi_TargetMediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class Attribute_StartupCommand extends SimpleCommand
   {
      
      public function Attribute_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new Attribute_MsgReceivedProxy());
         facade.registerProxy(new Attribute_MsgSenderProxy());
         facade.registerMediator(new Attribute_MainCharAttributePlaneMediator());
         facade.registerMediator(new Attribute_TargetCharAttributePlaneMediator());
         facade.registerMediator(new Attribute_TaJingmaiPanelMediator());
         facade.registerMediator(new XunzhangMediator());
         facade.registerMediator(new Xunzhang_TargetMediator());
         facade.registerMediator(new ZhanQi_Mediator());
         facade.registerMediator(new ZhanQi_TargetMediator());
      }
   }
}

