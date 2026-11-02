package com.tgame.shell.view.components.qitianleiji
{
   import com.asQuery.$;
   import com.fireice.text.FTextArea;
   import com.tgame.common.ui.componets.BasePanel;
   import com.zcp.common.events.BaseEvent;
   import flash.events.MouseEvent;
   import game.skin.gaishihuodong20230413Skin;
   import game.utils.SkinTools;
   
   public class NPCDialogPanel extends BasePanel
   {
      
      public static const NPCCUNHUA_JIAOSHUI:String = "NPCCUNHUA_JIAOSHUI";
      
      public static const NPCCUNHUA_LINGJIANG:String = "NPCCUNHUA_LINGJIANG";
      
      private var txt1:FTextArea;
      
      private var txt2:FTextArea;
      
      private var txt3:FTextArea;
      
      private var txt4:FTextArea;
      
      private var curType:int = 0;
      
      private var _id:int = 0;
      
      public function NPCDialogPanel()
      {
         super();
         this.skin = SkinTools.getChildSkinByName(gaishihuodong20230413Skin.skin,"gaishihuoudong");
         this.init();
      }
      
      private function init() : void
      {
         $("xxanniu1 xxanniu2 xxanniu3 xxanniu4",this,true).click(this.clickHanlder);
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
               dispatchEvent(new BaseEvent(NPCDialogPanel.NPCCUNHUA_JIAOSHUI,"",[1,this._id]));
               break;
            case "xxanniu2":
               dispatchEvent(new BaseEvent(NPCDialogPanel.NPCCUNHUA_JIAOSHUI,"",[2,this._id]));
               break;
            case "xxanniu3":
               dispatchEvent(new BaseEvent(NPCDialogPanel.NPCCUNHUA_LINGJIANG,"",this._id));
               break;
            case "xxanniu4":
         }
         this.onClose();
      }
      
      public function setMonsterID(param1:int, param2:int) : void
      {
         this._id = param1;
      }
   }
}

