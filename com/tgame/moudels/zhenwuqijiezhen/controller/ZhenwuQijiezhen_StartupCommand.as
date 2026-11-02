package com.tgame.moudels.zhenwuqijiezhen.controller
{
   import com.tgame.moudels.zhenwuqijiezhen.model.ZhenwuQijiezhen_MsgReceivedProxy;
   import com.tgame.moudels.zhenwuqijiezhen.model.ZhenwuQijiezhen_MsgSenderProxy;
   import com.tgame.moudels.zhenwuqijiezhen.view.ZhenwuQijiezhen_Mediator;
   import com.tgame.moudels.zhenwuqijiezhen.view.ZhenwuQijiezhen_TargetMediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class ZhenwuQijiezhen_StartupCommand extends SimpleCommand
   {
      
      public function ZhenwuQijiezhen_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new ZhenwuQijiezhen_MsgReceivedProxy());
         facade.registerProxy(new ZhenwuQijiezhen_MsgSenderProxy());
         facade.registerMediator(new ZhenwuQijiezhen_Mediator());
         facade.registerMediator(new ZhenwuQijiezhen_TargetMediator());
      }
   }
}

