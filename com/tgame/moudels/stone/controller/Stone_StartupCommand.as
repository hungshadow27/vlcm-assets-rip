package com.tgame.moudels.stone.controller
{
   import com.tgame.moudels.stone.model.Stone_MsgReceiveProxy;
   import com.tgame.moudels.stone.model.Stone_MsgSendProxy;
   import com.tgame.moudels.stone.view.HuiZhangHeCheng;
   import com.tgame.moudels.stone.view.UI_MainCharEasyEquipAddStoneMediator;
   import com.tgame.moudels.stone.view.UI_MainCharSixStoneToSevenStoneMediator;
   import com.tgame.moudels.stone.view.UI_MainCharStoneMediator;
   import com.tgame.moudels.stone.view.UI_XunzhangXiangqianMediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class Stone_StartupCommand extends SimpleCommand
   {
      
      public function Stone_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new Stone_MsgSendProxy());
         facade.registerProxy(new Stone_MsgReceiveProxy());
         facade.registerMediator(new UI_MainCharStoneMediator());
         facade.registerMediator(new UI_MainCharEasyEquipAddStoneMediator());
         facade.registerMediator(new UI_MainCharSixStoneToSevenStoneMediator());
         facade.registerMediator(new UI_XunzhangXiangqianMediator());
         facade.registerMediator(new HuiZhangHeCheng());
      }
   }
}

