package com.tgame.shell.view.components.qitianleiji
{
   import com.asQuery.$;
   import com.tgame.common.ui.componets.BasePanel;
   import com.zcp.common.events.BaseEvent;
   import flash.events.MouseEvent;
   import game.skin.NPCDuiHuaKuang2Skin;
   import game.utils.SkinTools;
   
   public class NPCDialogPanel_ShengDanDaZhan extends BasePanel
   {
      
      public static const NPCCUNHUA_JIAOSHUI:String = "NPCCUNHUA_JIAOSHUI1";
      
      public static const NPCCUNHUA_LINGJIANG:String = "NPCCUNHUA_LINGJIANG1";
      
      private var curType:int = 0;
      
      private var _id:int = 0;
      
      public function NPCDialogPanel_ShengDanDaZhan()
      {
         super();
         this.skin = SkinTools.getChildSkinByName(NPCDuiHuaKuang2Skin.skin,"NPCduihua1");
         this.init();
      }
      
      private function init() : void
      {
         $("xxanniu1 xxanniu2 xxanniu3",this,true).click(this.clickHanlder);
      }
      
      public function setType(param1:int) : void
      {
         this.curType = param1;
      }
      
      private function clickHanlder(param1:MouseEvent) : void
      {
         switch(param1.target.name)
         {
            case "xxanniu1":
               dispatchEvent(new BaseEvent(NPCDialogPanel_ShengDanDaZhan.NPCCUNHUA_JIAOSHUI,"",this._id));
               break;
            case "xxanniu2":
               dispatchEvent(new BaseEvent(NPCDialogPanel_ShengDanDaZhan.NPCCUNHUA_LINGJIANG,"",this._id));
               break;
            case "xxanniu3":
         }
         this.onClose();
      }
      
      public function setMonsterID(param1:int) : void
      {
         this._id = param1;
      }
   }
}

