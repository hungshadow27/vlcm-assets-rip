package com.tgame.shell.view.components.shiJieBei
{
   import com.fireice.list.FListCellRenderer;
   import com.fireice.text.FTextArea;
   import com.tgame.common.GameConfig;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.POPWindowManager;
   import com.tgame.common.ui.componets.SecondButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.utils.LoadSwf;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.TextFormat;
   
   public class ShengFuJingCaiList extends FListCellRenderer
   {
      
      public static var _$parent:DisplayObject;
      
      private static var xiazhupanel:ShiJieBeiXiaZhuPanel;
      
      private var tf:TextFormat;
      
      private var bit:Bitmap;
      
      private var changci:FTextArea;
      
      private var bg:DisplayObject;
      
      private var gq1:DisplayObject;
      
      private var gq2:DisplayObject;
      
      private var duiwu:FTextArea;
      
      private var saibie:FTextArea;
      
      private var xiaZhuFta:FTextArea;
      
      private var xiazhuBtn:SecondButton;
      
      private var duzhuFT:FTextArea;
      
      private var jiangliBtn:SecondButton;
      
      private var shengfuSpr:Sprite;
      
      private var shengfuBg:DisplayObject;
      
      public function ShengFuJingCaiList()
      {
         super();
      }
      
      override public function initUI() : void
      {
         _height = 130;
         this.tf = new TextFormat();
         this.tf.align = "center";
         this.bg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/shijiebei/bisaiBg.swf");
         this.bg.x = 2;
         this.bg.y = 2;
         addChild(this.bg);
         this.gq1 = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/shijiebei/" + data.guoJiaId1 + ".swf");
         this.gq1.x = 147;
         this.gq1.y = 28;
         addChild(this.gq1);
         this.gq2 = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/shijiebei/" + data.guoJiaId2 + ".swf");
         this.gq2.x = 485;
         this.gq2.y = 28;
         addChild(this.gq2);
         this.changci = new FTextArea();
         addChild(this.changci);
         this.changci.multiline = true;
         this.changci.defaultTextFormat = this.tf;
         this.changci.wordWrap = true;
         this.changci.width = 200;
         this.changci.x = -35;
         this.changci.y = 53;
         this.changci.htmlText = "<font size = \'16\' color = \'" + StaticValue.WHITE_HTML + "\'> " + LanResManager.getLanCommonTextWords("第") + data.id + LanResManager.getLanCommonTextWords("场") + "</font>";
         this.duiwu = new FTextArea();
         addChild(this.duiwu);
         this.duiwu.multiline = true;
         this.duiwu.defaultTextFormat = this.tf;
         this.duiwu.wordWrap = true;
         this.duiwu.width = 200;
         this.duiwu.x = 255;
         this.duiwu.y = 40;
         this.duiwu.htmlText = "<font size = \'14\' color = \'" + StaticValue.WHITE_HTML + "\'> " + data.guoJiaName1 + " VS " + data.guoJiaName2 + "</font>";
         this.saibie = new FTextArea();
         addChild(this.saibie);
         this.saibie.multiline = true;
         this.saibie.defaultTextFormat = this.tf;
         this.saibie.wordWrap = true;
         this.saibie.width = 200;
         this.saibie.x = 258;
         this.saibie.y = 75;
         this.saibie.htmlText = "<font size = \'14\' color = \'" + StaticValue.WHITE_HTML + "\'> " + data.time + "</font>";
         this.shengfuSpr = new Sprite();
         addChild(this.shengfuSpr);
         if(data.status != 0)
         {
            this.xiaZhuFta = new FTextArea();
            addChild(this.xiaZhuFta);
            this.xiaZhuFta.multiline = true;
            this.xiaZhuFta.defaultTextFormat = this.tf;
            this.xiaZhuFta.wordWrap = true;
            this.xiaZhuFta.width = 200;
            this.xiaZhuFta.x = 300 + 250;
            this.xiaZhuFta.y = 20 + 20;
            if(data.status == -1)
            {
               this.xiaZhuFta.htmlText = "<font color = \'" + StaticValue.WHITE_HTML + "\'> " + LanResManager.getLanCommonTextWords("已下注：平局") + "</font>";
            }
            else if(data.status == data.guoJiaId1)
            {
               this.xiaZhuFta.htmlText = "<font color = \'" + StaticValue.WHITE_HTML + "\'> " + LanResManager.getLanCommonTextWords("已下注：") + data.guoJiaName1 + LanResManager.getLanCommonTextWords("胜") + "</font>";
            }
            else
            {
               this.xiaZhuFta.htmlText = "<font color = \'" + StaticValue.WHITE_HTML + "\'> " + LanResManager.getLanCommonTextWords("已下注：") + data.guoJiaName2 + LanResManager.getLanCommonTextWords("胜") + "</font>";
            }
         }
         else
         {
            this.xiazhuBtn = new SecondButton();
            addChild(this.xiazhuBtn);
            this.xiazhuBtn.x = 640;
            this.xiazhuBtn.y = 30;
            this.xiazhuBtn.label = LanResManager.getLanCommonTextWords("下注");
            this.xiazhuBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         }
         this.jiangliBtn = new SecondButton();
         addChild(this.jiangliBtn);
         this.jiangliBtn.x = 626;
         this.jiangliBtn.y = 77;
         if(data.lingqu == 1)
         {
            this.jiangliBtn.label = LanResManager.getLanCommonTextWords("已领取");
            this.jiangliBtn.enabled = false;
         }
         else if(data.lingqu == 0)
         {
            this.jiangliBtn.label = LanResManager.getLanCommonTextWords("领取奖励");
            this.jiangliBtn.enabled = true;
         }
         this.jiangliBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         if(data.jieguo == data.guoJiaId1)
         {
            this.shengli(1);
         }
         else if(data.jieguo == data.guoJiaId2)
         {
            this.shengli(3);
         }
         else if(data.jieguo == 0)
         {
            this.shengli(0);
         }
         else if(data.jieguo == -1)
         {
            this.shengli(2);
         }
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.xiazhuBtn:
               this.showXiazhu(data.id,data.guoJiaId1,data.guoJiaId2,data.guoJiaName1,data.guoJiaName2,data.xiaZhu);
               break;
            case this.jiangliBtn:
               _$parent.dispatchEvent(new BaseEvent(ShiJieBeiPanel.UI_SHIJIEBEI_SHENGFUJINGCAI_XIAZHU_LINGQU,"",data.id));
         }
      }
      
      private function showXiazhu(param1:int, param2:int, param3:int, param4:String, param5:String, param6:int) : void
      {
         if(xiazhupanel == null)
         {
            xiazhupanel = new ShiJieBeiXiaZhuPanel();
            xiazhupanel._$parent = _$parent;
         }
         xiazhupanel.visible = true;
         xiazhupanel.setCs(param1,param2,param3,param4,param5,param6);
         POPWindowManager.showWindow(xiazhupanel);
      }
      
      private function shengli(param1:int) : void
      {
         while(this.shengfuSpr.numChildren > 0)
         {
            this.shengfuSpr.removeChildAt(0);
         }
         if(param1 == 1)
         {
            this.shengfuBg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/shijiebei/shengli.swf");
            this.shengfuBg.x = 188;
            this.shengfuBg.y = 67;
            this.shengfuSpr.addChild(this.shengfuBg);
         }
         else if(param1 == 2)
         {
            this.shengfuBg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/shijiebei/pingju.swf");
            this.shengfuBg.x = 188 + 130;
            this.shengfuBg.y = 67;
            this.shengfuSpr.addChild(this.shengfuBg);
         }
         else if(param1 == 3)
         {
            this.shengfuBg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/shijiebei/shengli.swf");
            this.shengfuBg.x = 188 + 130 + 130;
            this.shengfuBg.y = 67;
            this.shengfuSpr.addChild(this.shengfuBg);
         }
      }
   }
}

