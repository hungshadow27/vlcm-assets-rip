package com.tgame.shell.view.components.fabao
{
   import com.fireice.list.FListCellRenderer;
   import com.fireice.text.FTextArea;
   import com.fireice.util.FLoader;
   import com.tgame.common.GameConfig;
   import com.tgame.common.ui.componets.*;
   import flash.display.DisplayObject;
   import flash.text.*;
   
   public class FabaoListRander extends FListCellRenderer
   {
      
      private var ft:FTextArea;
      
      private var tf:TextFormat;
      
      private var img:DisplayObject;
      
      public function FabaoListRander()
      {
         super();
      }
      
      override public function initUI() : void
      {
         _height = 50;
         this.tf = new TextFormat();
         this.tf.align = "center";
         this.ft = new FTextArea();
         with(this.ft)
         {
            x = 15;
            y = 15;
            width = 36;
            height = 22;
            autoSize = TextFieldAutoSize.LEFT;
            filters = StaticValue.filter;
            textColor = StaticValue.WHITE;
            htmlText = "<font size=\'14\'>" + data.name + "</font>";
         }
         addChild(this.ft);
         if(data.gid != 0)
         {
            this.img = FLoader.startLoad(GameConfig.fileBaseFolder + "res/ui/UIditu/fabao/small/" + data.icoID + ".png",48,32);
            this.img.x = 108;
            this.img.y = 5;
            addChild(this.img);
         }
      }
   }
}

