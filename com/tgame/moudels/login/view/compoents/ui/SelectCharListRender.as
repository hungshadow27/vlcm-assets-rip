package com.tgame.moudels.login.view.compoents.ui
{
   import com.fireice.list.FListCellRenderer;
   import com.fireice.text.FTextArea;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.StaticValue;
   import flash.display.Bitmap;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.text.TextFieldAutoSize;
   import flash.utils.getDefinitionByName;
   
   public class SelectCharListRender extends FListCellRenderer
   {
      
      public var mcSelected:MovieClip;
      
      public function SelectCharListRender()
      {
         super();
      }
      
      override public function initUI() : void
      {
         var listContainer:Sprite;
         var strLujing:String = null;
         var img:Bitmap = null;
         var str:String = null;
         var $class:Class = null;
         var char:FTextArea = null;
         _height = 67;
         listContainer = new Sprite();
         addChild(listContainer);
         with(listContainer)
         {
            y = -30;
            graphics.beginFill(16711680,0.1);
            graphics.drawRect(0,0,1,1);
            graphics.endFill();
         }
         if(data.id == "")
         {
            str = "ui.login.xuanzheJiaose.chuangjian.txt";
            img = StaticValue.getBitmapByClassName(str);
            addChild(img);
            img.x = -8;
            img.y = 48;
         }
         else
         {
            switch(data.party.toString())
            {
               case LanResManager.getLanCommonTextWords("少林派"):
                  strLujing = "shaolin";
                  break;
               case LanResManager.getLanCommonTextWords("全真教"):
                  strLujing = "quanzhen";
                  break;
               case LanResManager.getLanCommonTextWords("古墓派"):
                  strLujing = "gumu";
                  break;
               case LanResManager.getLanCommonTextWords("桃花岛"):
                  strLujing = "taohua";
                  break;
               case LanResManager.getLanCommonTextWords("白驼山"):
                  strLujing = "baituoshan";
                  break;
               case LanResManager.getLanCommonTextWords("明教"):
                  strLujing = "mingjiao";
            }
            str = "ui.login.chuangjian." + strLujing + ".txt";
            img = StaticValue.getBitmapByClassName(str);
            addChild(img);
            img.x = 0;
            img.y = 50;
            $class = getDefinitionByName("ui.login.rolelist.selected") as Class;
            this.mcSelected = new $class() as MovieClip;
            this.mcSelected.stop();
            this.mcSelected.visible = false;
            this.mcSelected.x = 50;
            this.mcSelected.y = 50;
            this.mcSelected.mouseEnabled = false;
            addChildAt(this.mcSelected,numChildren - 2);
            str = "ui.login.chuangjian.touxiang." + strLujing;
            img = StaticValue.getBitmapByClassName(str);
            addChildAt(img,numChildren - 1);
            img.x = -13;
            img.y = -31;
            char = new FTextArea();
            addChild(char);
            char.filters = StaticValue.filter;
            char.textColor = 16578258;
            char.x = 108;
            char.y = 12;
            char.autoSize = TextFieldAutoSize.LEFT;
            char.htmlText = "<textformat leading= \'16\'>" + data.label + "<br>  " + data.level + LanResManager.getLanCommonTextWords("级") + "</textformat>";
         }
      }
      
      public function showMC(param1:Boolean = true) : void
      {
         if(this.mcSelected)
         {
            if(param1)
            {
               this.mcSelected.play();
            }
            else
            {
               this.mcSelected.stop();
            }
            this.mcSelected.visible = param1;
         }
      }
   }
}

