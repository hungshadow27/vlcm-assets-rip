package com.tgame.moudels.gift.controller
{
   import com.tgame.common.GameInstance;
   import com.tgame.common.vo.item.Skill;
   import com.tgame.moudels.gift.model.GIFT_MsgSenderProxy;
   import com.tgame.shell.view.components.huodong.WugongShengjiDanpanel;
   import com.zcp.common.events.BaseEvent;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class Gift_OpenUpgradeSkillCommand extends SimpleCommand
   {
      
      public function Gift_OpenUpgradeSkillCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         var $note:INotification = param1;
         var data:Object = $note.getBody();
         var skillArr:Array = GameInstance.mainCharData.skillInfo.getCanUpSkillList();
         var skillPanel:WugongShengjiDanpanel = new WugongShengjiDanpanel(skillArr);
         skillPanel.addEventListener(WugongShengjiDanpanel.UI_WUGONGSHENGJIDAN_OK,function(param1:BaseEvent):void
         {
            var _loc2_:GIFT_MsgSenderProxy = facade.retrieveProxy(GIFT_MsgSenderProxy.NAME) as GIFT_MsgSenderProxy;
            _loc2_.send_53053((param1.data as Skill).id);
         });
         skillPanel.x = GameInstance.stage.stageWidth / 2 - skillPanel.panelWidth / 2;
         skillPanel.y = GameInstance.stage.stageHeight / 2 - skillPanel.panelHeight / 2;
         GameInstance.uiInstance.uiContainer.addChild(skillPanel);
      }
   }
}

