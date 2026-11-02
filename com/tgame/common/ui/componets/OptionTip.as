package com.tgame.common.ui.componets
{
   import com.tgame.common.GameInstance;
   import com.zcp.common.utils.Fun;
   import flash.display.DisplayObject;
   
   public class OptionTip
   {
      
      public function OptionTip()
      {
         super();
      }
      
      public static function showTip(param1:int, param2:String) : LeadArrowTip
      {
         var _loc3_:DisplayObject = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = -1;
         var _loc7_:int = -1;
         switch(param1)
         {
            case 1:
               _loc3_ = GameInstance.uiInstance.npcDialogPanel.taskList;
               _loc4_ = 220;
               _loc5_ = GameInstance.uiInstance.npcDialogPanel.taskList.y + GameInstance.uiInstance.npcDialogPanel.taskList.height + 60;
               _loc6_ = 250;
               _loc7_ = GameInstance.uiInstance.npcDialogPanel.taskList.y + GameInstance.uiInstance.npcDialogPanel.taskList.height;
               break;
            case 2:
               _loc3_ = GameInstance.uiInstance.npcDialogPanel.taskDialog;
               _loc4_ = 220;
               _loc5_ = GameInstance.uiInstance.npcDialogPanel.taskDialog.y + GameInstance.uiInstance.npcDialogPanel.taskDialog.height + 60;
               _loc6_ = 250;
               _loc7_ = GameInstance.uiInstance.npcDialogPanel.taskDialog.y + GameInstance.uiInstance.npcDialogPanel.taskDialog.height;
               break;
            case 3:
               _loc3_ = GameInstance.uiInstance.npcDialogPanel.taskList;
               _loc4_ = 220;
               _loc5_ = GameInstance.uiInstance.npcDialogPanel.taskList.y + GameInstance.uiInstance.npcDialogPanel.taskList.height + 60;
               _loc6_ = 250;
               _loc7_ = GameInstance.uiInstance.npcDialogPanel.taskList.y + GameInstance.uiInstance.npcDialogPanel.taskList.height;
               break;
            case 4:
               _loc3_ = GameInstance.uiInstance.mainUI.taskContainer.listContainer;
               _loc4_ = -165;
               _loc5_ = 10;
               _loc6_ = 0;
               _loc7_ = 48;
               break;
            case 5:
               _loc3_ = GameInstance.uiInstance.mainUI.functionContainer.taskBtn;
               _loc4_ = 170 + 548;
               _loc5_ = -110;
               _loc6_ = 230 + 548;
               _loc7_ = 0;
               break;
            case 6:
               _loc3_ = GameInstance.uiInstance.taskPanel.acceptedTask.tipContainer;
               _loc4_ = 255;
               _loc5_ = 200;
               _loc6_ = 290;
               _loc7_ = 150;
               break;
            case 7:
               _loc3_ = GameInstance.uiInstance.taskPanel.acceptedTask.tipContainer;
               _loc4_ = 255;
               _loc5_ = 200;
               _loc6_ = 290;
               _loc7_ = 150;
               break;
            case 8:
               _loc3_ = GameInstance.uiInstance.taskPanel.acceptedTask.tipContainer;
               _loc4_ = 255;
               _loc5_ = 200;
               _loc6_ = 290;
               _loc7_ = 150;
               break;
            case 9:
               _loc3_ = GameInstance.uiInstance.mainUI.functionContainer.backpackBtn;
               _loc4_ = 70;
               _loc5_ = -110;
               _loc6_ = 100;
               _loc7_ = 0;
               break;
            case 10:
               _loc3_ = GameInstance.uiInstance.backpack.slots;
               _loc4_ = -205;
               _loc5_ = 50;
               _loc6_ = 0;
               _loc7_ = 75;
               break;
            case 11:
               _loc3_ = GameInstance.uiInstance.mainUI.taskContainer.listContainer;
               _loc4_ = -165;
               _loc5_ = 10;
               _loc6_ = 0;
               _loc7_ = 48;
               break;
            case 12:
               _loc3_ = GameInstance.uiInstance.mainUI.functionContainer.circleBar.jumpBtn;
               if(GameInstance.uiInstance.mainUI.functionContainer.circleBar.visible == false)
               {
                  GameInstance.uiInstance.mainUI.functionContainer.circleBar.visible = true;
                  GameInstance.uiInstance.mainUI.functionContainer.rectBar.visible = false;
               }
               _loc4_ = 140;
               _loc5_ = -100;
               _loc6_ = 165;
               _loc7_ = 0;
               break;
            case 13:
               _loc3_ = GameInstance.uiInstance.mainUI;
               _loc4_ = 0;
               _loc5_ = 80;
               _loc6_ = 45;
               _loc7_ = 50;
               break;
            case 14:
               _loc3_ = GameInstance.uiInstance.mainUI.functionContainer.backpackBtn;
               _loc4_ = 180;
               _loc5_ = -110;
               _loc6_ = 268;
               _loc7_ = 0;
               break;
            case 15:
               _loc3_ = GameInstance.uiInstance.mainUI.taskContainer.listContainer;
               _loc4_ = 0;
               _loc5_ = 105;
               _loc6_ = 40;
               _loc7_ = 58;
               break;
            case 16:
               _loc3_ = GameInstance.uiInstance.mainUI;
               _loc4_ = 0;
               _loc5_ = 80;
               _loc6_ = 45;
               _loc7_ = 50;
               break;
            case 17:
            case 18:
               _loc3_ = GameInstance.uiInstance.mainUI.functionContainer.backpackBtn;
               _loc4_ = 140;
               _loc5_ = -110;
               _loc6_ = 180;
               _loc7_ = 0;
               break;
            case 19:
               _loc3_ = GameInstance.uiInstance.npcDialogPanel.functionList;
               _loc4_ = -165;
               _loc5_ = 0;
               _loc6_ = 0;
               _loc7_ = 40;
               break;
            case 20:
               _loc3_ = GameInstance.uiInstance.npcShopPanel.itemCanvas;
               _loc4_ = -155;
               _loc5_ = 50;
               _loc6_ = 0;
               _loc7_ = 75;
               break;
            case 21:
            case 22:
            case 23:
               _loc3_ = GameInstance.uiInstance.mainUI.chatContainer.input;
               _loc4_ = 22;
               _loc5_ = -30;
               _loc6_ = 45;
               _loc7_ = 2;
               break;
            case 24:
            case 25:
            case 26:
               break;
            default:
               _loc3_ = GameInstance.uiInstance.mainUI;
               _loc4_ = 0;
               _loc5_ = 80;
               _loc6_ = 45;
               _loc7_ = 50;
         }
         if(_loc3_ == null || Fun.isVisible(_loc3_) == false || _loc3_.parent == null)
         {
            return null;
         }
         param2 = param2.replace(/\\n/g,"<br>");
         param2 = param2.replace(/{link\#\s*color:([A-Fa-f0-9]+)\s*,\s*type:(\d+)}/g,"<font color=\'#$1\'>");
         param2 = param2.replace(/{\s*\/\s*link\s*}/g,"</font>");
         return LeadArrowTip.showTip(_loc3_,param2,_loc4_,_loc5_,_loc6_,_loc7_);
      }
   }
}

