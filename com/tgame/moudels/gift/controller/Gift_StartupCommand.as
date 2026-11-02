package com.tgame.moudels.gift.controller
{
   import com.tgame.moudels.gift.Gift_ApplicationFacade;
   import com.tgame.moudels.gift.model.GIFT_MsgReceivedProxy;
   import com.tgame.moudels.gift.model.GIFT_MsgSenderProxy;
   import com.tgame.moudels.gift.view.Gift_GiftMediator;
   import com.tgame.moudels.gift.view.Gift_HuodongMediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class Gift_StartupCommand extends SimpleCommand
   {
      
      public function Gift_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerMediator(new Gift_GiftMediator());
         facade.registerMediator(new Gift_HuodongMediator());
         facade.registerProxy(new GIFT_MsgReceivedProxy());
         facade.registerProxy(new GIFT_MsgSenderProxy());
         facade.registerCommand(Gift_ApplicationFacade.SHOW_WGSJD_PANEL,Gift_OpenUpgradeSkillCommand);
         facade.registerCommand(Gift_ApplicationFacade.SHOW_PTYHTQK_PANEL,Gift_OpenSelectGoodsCommand);
      }
   }
}

