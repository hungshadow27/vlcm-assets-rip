package com.tgame.moudels.equipPudding.controller
{
   import com.tgame.moudels.equipPudding.EquipPudding_ApplicationFacade;
   import com.tgame.moudels.equipPudding.model.EquipPudding_MsgReceivedProxy;
   import com.tgame.moudels.equipPudding.model.EquipPudding_MsgSendProxy;
   import com.tgame.moudels.equipPudding.model.EquipPudding_Proxy;
   import com.tgame.moudels.equipPudding.view.Equip2BaoShiMediator;
   import com.tgame.moudels.equipPudding.view.EquipKuaisushengjieMediator;
   import com.tgame.moudels.equipPudding.view.EquipZhuangBeiYangChengMediator;
   import com.tgame.moudels.equipPudding.view.Equip_CopyMediator;
   import com.tgame.moudels.equipPudding.view.Equip_KeWenMediator;
   import com.tgame.moudels.equipPudding.view.UI_MainCharEquipPuddingPanelMediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class EquipPudding_StartupCommand extends SimpleCommand
   {
      
      public function EquipPudding_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerCommand(EquipPudding_ApplicationFacade.EQUIP_STONE_SEND_50125,EquipPudding_OtherMsgSendCommand);
         facade.registerProxy(new EquipPudding_Proxy());
         facade.registerProxy(new EquipPudding_MsgSendProxy());
         facade.registerProxy(new EquipPudding_MsgReceivedProxy());
         facade.registerMediator(new UI_MainCharEquipPuddingPanelMediator());
         facade.registerMediator(new Equip2BaoShiMediator());
         facade.registerMediator(new EquipKuaisushengjieMediator());
         facade.registerMediator(new EquipZhuangBeiYangChengMediator());
         facade.registerMediator(new Equip_KeWenMediator());
         facade.registerMediator(new Equip_CopyMediator());
      }
   }
}

