package com.tgame.shell.view.components
{
   import com.fireice.button.FSimpleButton;
   import com.fireice.checkBox.FCheckBox;
   import com.fireice.list.FListCellRenderer;
   import com.fireice.text.FTextArea;
   import com.tgame.common.GameConfig;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.utils.LoadSwf;
   import com.tgame.common.utils.ToolTips;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.events.MouseEvent;
   import flash.text.TextFormat;
   
   public class GeRenChengHaoList extends FListCellRenderer
   {
      
      public static var $parent:DisplayObject;
      
      private var tf:TextFormat;
      
      private var bit:Bitmap;
      
      private var chenghao:FTextArea;
      
      private var mingzi:FTextArea;
      
      private var bg1:DisplayObject;
      
      private var xianshiBtn:FSimpleButton;
      
      private var check:FCheckBox;
      
      public function GeRenChengHaoList()
      {
         super();
      }
      
      override public function initUI() : void
      {
         this.tf = new TextFormat();
         this.tf.align = "center";
         if(data.biaoqianType != 3)
         {
            _height = 40;
            this.xianshiBtn = new FSimpleButton();
            addChild(this.xianshiBtn);
            this.xianshiBtn.x = 1;
            this.xianshiBtn.y = 1;
            this.xianshiBtn.skin = "chenghaoDTButton";
            this.check = new FCheckBox();
            this.check.x = 10;
            this.check.y = 10;
            this.check.visible = false;
            this.check.addEventListener(MouseEvent.CLICK,this.onCheckClick);
         }
         else
         {
            _height = 28;
            this.check = new FCheckBox();
            this.check.visible = false;
            this.check.x = 10;
            this.check.y = 10;
            this.check.addEventListener(MouseEvent.CLICK,this.onCheckClick);
         }
         this.chenghao = new FTextArea();
         addChild(this.chenghao);
         this.chenghao.multiline = true;
         this.chenghao.wordWrap = true;
         this.chenghao.width = 200;
         this.chenghao.height = 20;
         this.chenghao.mouseEnabled = false;
         if(data.biaoqianType == 3)
         {
            this.chenghao.x = 15;
            this.chenghao.y = 4;
            this.chenghao.htmlText = "<font color = \'" + StaticValue.WHITE_HTML + "\'>" + data.name + "</font>";
            this.mingzi = new FTextArea();
            addChild(this.mingzi);
            this.mingzi.multiline = true;
            this.mingzi.wordWrap = true;
            this.mingzi.width = 200;
            this.mingzi.height = 20;
            this.mingzi.mouseEnabled = false;
            this.mingzi.x = 130;
            this.mingzi.y = 4;
            this.mingzi.htmlText = "<font color = \'" + StaticValue.WHITE_HTML + "\'>" + data.chenghao + " </font>";
         }
         else
         {
            this.chenghao.defaultTextFormat = this.tf;
            this.chenghao.x = -3;
            this.chenghao.y = 12;
            this.chenghao.htmlText = "<font color = \'" + StaticValue.WHITE_HTML + "\'> " + data.name + " </font>";
         }
         if(data.biaoqianType == 1)
         {
            this.bg1 = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/gerenchenghao/huode.swf");
            this.check.visible = data.jihuo;
            this.check.selectState = data.gouxuan;
         }
         else if(data.biaoqianType == 2)
         {
            this.bg1 = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/gerenchenghao/jihuo.swf");
         }
         else
         {
            this.bg1 = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/gerenchenghao/jihuo.swf");
         }
         this.bg1.x = 160 - 15;
         this.bg1.y = 10;
         addChild(this.bg1);
         this.bg1.visible = false;
         if(data.jihuo)
         {
            this.bg1.visible = true;
         }
         else
         {
            this.bg1.visible = false;
         }
         addChild(this.check);
         ToolTips.createToolTips(this.check,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("勾选显示称号") + "<br>";
            return _loc1_ + "</textformat>";
         });
      }
      
      private function onCheckClick(param1:MouseEvent) : void
      {
         $parent.dispatchEvent(new BaseEvent(GeRenChengHao.UI_GERENCHENGHAO_PUTONG_GOUXUAN_CLICK,"",[data.id,this.check.selectState]));
      }
   }
}

