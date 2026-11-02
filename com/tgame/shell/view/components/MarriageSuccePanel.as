package com.tgame.shell.view.components
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FTextArea;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import flash.display.Bitmap;
   import flash.events.MouseEvent;
   import flash.text.*;
   
   public class MarriageSuccePanel extends FPanel
   {
      
      public static const UI_MARRIAGESUCCEPANEL_QUEDING_CLICK:String = "UI_MARRIAGESUCCEPANEL_QUEDING_CLICK";
      
      private var ft:FTextArea;
      
      private var ft1:FTextArea;
      
      private var ft2:FTextArea;
      
      private var ft3:FTextArea;
      
      private var OkBtn:SecondButton;
      
      private var QuxiaoBtn:SecondButton;
      
      private var touxiangImg1:Bitmap;
      
      private var touxiangImg2:Bitmap;
      
      public function MarriageSuccePanel()
      {
         var bg:Bitmap;
         var v:Vector.<Bitmap>;
         var tf:TextFormat;
         super();
         skin = "panel_btn";
         dragAble = true;
         showCloseButton = true;
         this.dragRestrict = false;
         width = 393;
         height = 495;
         titleText = LanResManager.getLanCommonTextWords("结婚成功");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         bg = new Bitmap();
         bg.name = "ui.marriage.succe.ui";
         addChild(bg);
         bg.x = 10;
         bg.y = 2;
         v = new Vector.<Bitmap>();
         v.push(bg);
         this.DynamicManageImages = v;
         tf = new TextFormat();
         tf.align = "center";
         this.ft1 = new FTextArea();
         with(this.ft1)
         {
            x = 93;
            y = 10;
            wordWrap = true;
            width = 100;
            defaultTextFormat = tf;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.BLUE;
            filters = StaticValue.filter;
            htmlText = LanResManager.getLanCommonTextWords("玩家名字六字");
         }
         addChild(this.ft1);
         this.ft2 = new FTextArea();
         with(this.ft2)
         {
            x = 200;
            y = 10;
            wordWrap = true;
            width = 100;
            defaultTextFormat = tf;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.BLUE;
            filters = StaticValue.filter;
            htmlText = LanResManager.getLanCommonTextWords("玩家名字六字");
         }
         addChild(this.ft2);
         this.ft3 = new FTextArea();
         with(this.ft3)
         {
            x = 107;
            y = 100;
            wordWrap = true;
            width = 300;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.BLUE;
            filters = StaticValue.filter;
            htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("在天愿作比翼鸟 在地愿为连理枝") + "</font><br>" + "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("恭喜您与XXXX玩家结婚成功。") + "</font>" + "</textformat>";
         }
         addChild(this.ft3);
         this.ft = new FTextArea();
         with(this.ft)
         {
            x = 20;
            y = 145;
            wordWrap = true;
            width = 360;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.BLUE;
            filters = StaticValue.filter;
            htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("请在【组队】界面【我的配偶】面板中查询更多信息") + "</font>" + "</textformat>";
         }
         addChild(this.ft);
         this.ft = new FTextArea();
         with(this.ft)
         {
            x = 20;
            y = 180;
            wordWrap = true;
            width = 360;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.BLUE;
            filters = StaticValue.filter;
            htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.ORANGE_HTML + "\'>" + LanResManager.getLanCommonTextWords("接下来您不妨尝试举办一场婚宴") + "：</font>" + "</textformat>";
         }
         addChild(this.ft);
         this.ft = new FTextArea();
         with(this.ft)
         {
            x = 20;
            y = 210;
            wordWrap = true;
            width = 360;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.BLUE;
            filters = StaticValue.filter;
            htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanTextWords(this,"普通婚宴",[250]) + "</font><br>" + "<font color=\'" + StaticValue.WHITE_HTML + "\'>        " + LanResManager.getLanCommonTextWords("襄阳城流水席每份酒菜均可以令人增加大量经验与真气") + "</font>" + "</textformat>";
         }
         addChild(this.ft);
         this.ft = new FTextArea();
         with(this.ft)
         {
            x = 20;
            y = 260;
            wordWrap = true;
            width = 360;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.BLUE;
            filters = StaticValue.filter;
            htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.BLUE_HTML + "\'>" + LanResManager.getLanTextWords(this,"富贵婚宴",[2500]) + "</font><br>" + "<font color=\'" + StaticValue.BLUE_HTML + "\'>        " + LanResManager.getLanCommonTextWords("襄阳城流水席每份酒菜均可以令人增加海量经验与真气") + "</font><br>" + "<font color=\'" + StaticValue.BLUE_HTML + "\'>        " + LanResManager.getLanCommonTextWords("席间会有【金钱鼠】前来助兴") + "</font>" + "</textformat>";
         }
         addChild(this.ft);
         this.ft = new FTextArea();
         with(this.ft)
         {
            x = 20;
            y = 326;
            wordWrap = true;
            width = 360;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.BLUE;
            filters = StaticValue.filter;
            htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.PURPLE_HTML + "\'>" + LanResManager.getLanTextWords(this,"豪门婚宴",[25000]) + "</font><br>" + "<font color=\'" + StaticValue.PURPLE_HTML + "\'>        " + LanResManager.getLanCommonTextWords("襄阳城流水席每份酒菜均可以令人增加巨量经验与真气") + "</font><br>" + "<font color=\'" + StaticValue.PURPLE_HTML + "\'>        " + LanResManager.getLanCommonTextWords("席间会有【金钱鼠】与【寻宝鼠】前来助兴") + "</font>" + "</textformat>";
         }
         addChild(this.ft);
         this.ft = new FTextArea();
         with(this.ft)
         {
            x = 20;
            y = 394;
            wordWrap = true;
            width = 360;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.BLUE;
            filters = StaticValue.filter;
            htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("在【组队】界面【我的配偶】面板中可以进行婚宴举办") + "</font>" + "</textformat>";
         }
         addChild(this.ft);
         this.OkBtn = new SecondButton();
         this.OkBtn.label = LanResManager.getLanCommonTextWords("确定");
         addChild(this.OkBtn);
         this.OkBtn.x = 108;
         this.OkBtn.y = 430;
         this.OkBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.QuxiaoBtn = new SecondButton();
         this.QuxiaoBtn.label = LanResManager.getLanCommonTextWords("关闭");
         addChild(this.QuxiaoBtn);
         this.QuxiaoBtn.x = 228;
         this.QuxiaoBtn.y = 430;
         this.QuxiaoBtn.addEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      private function onClose(param1:FCloseEvent = null) : void
      {
         if(parent != null)
         {
            this.parent.removeChild(this);
         }
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.OkBtn:
               this.onClose();
               break;
            case this.QuxiaoBtn:
               this.onClose();
         }
      }
      
      public function setInitialize(param1:String, param2:String, param3:String, param4:String, param5:String) : void
      {
         this.ft1.htmlText = param1;
         this.ft2.htmlText = param3;
         if(this.touxiangImg1 != null && this.touxiangImg1.parent != null)
         {
            this.touxiangImg1.parent.removeChild(this.touxiangImg1);
         }
         this.touxiangImg1 = StaticValue.getBitmapByClassName(param2);
         this.touxiangImg1.x = 123;
         this.touxiangImg1.y = 41;
         addChild(this.touxiangImg1);
         this.touxiangImg1.width = 40;
         this.touxiangImg1.height = 40;
         if(this.touxiangImg2 != null && this.touxiangImg2.parent != null)
         {
            this.touxiangImg2.parent.removeChild(this.touxiangImg2);
         }
         this.touxiangImg2 = StaticValue.getBitmapByClassName(param4);
         this.touxiangImg2.x = 230;
         this.touxiangImg2.y = 41;
         addChild(this.touxiangImg2);
         this.touxiangImg2.width = 40;
         this.touxiangImg2.height = 40;
         this.ft3.htmlText = "<textformat leading=\'6\'>" + "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanCommonTextWords("在天愿作比翼鸟 在地愿为连理枝") + "</font><br>" + "<font color=\'" + StaticValue.YELLOW_HTML + "\'>" + LanResManager.getLanTextWords(this,"结婚成功",[param5]) + "</font>" + "</textformat>";
      }
   }
}

