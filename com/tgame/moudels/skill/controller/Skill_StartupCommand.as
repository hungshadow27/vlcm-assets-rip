package com.tgame.moudels.skill.controller
{
   import com.tgame.moudels.skill.model.Skill_MsgReceivedProxy;
   import com.tgame.moudels.skill.model.Skill_MsgSenderProxy;
   import com.tgame.moudels.skill.model.Skill_Proxy;
   import com.tgame.moudels.skill.view.Skill_Banghui_Mediator;
   import com.tgame.moudels.skill.view.Skill_Mediator;
   import com.tgame.moudels.skill.view.Skill_XinFaXiuLian_Mediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class Skill_StartupCommand extends SimpleCommand
   {
      
      public function Skill_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new Skill_Proxy());
         facade.registerProxy(new Skill_MsgReceivedProxy());
         facade.registerProxy(new Skill_MsgSenderProxy());
         facade.registerMediator(new Skill_Mediator());
         facade.registerMediator(new Skill_XinFaXiuLian_Mediator());
         facade.registerMediator(new Skill_Banghui_Mediator());
      }
   }
}

