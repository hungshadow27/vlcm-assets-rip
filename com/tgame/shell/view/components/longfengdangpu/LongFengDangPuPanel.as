package com.tgame.shell.view.components.longfengdangpu
{
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.scroll.FVScorllBar;
   import com.fireice.text.FTextArea;
   import com.fireice.text.FTextInput;
   import com.tgame.common.GameConfig;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.NewButton;
   import com.tgame.common.ui.componets.SmallButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.utils.LoadSwf;
   import com.tgame.common.utils.ToolTips;
   import com.zcp.common.events.BaseEvent;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.TextFormat;
   
   public class LongFengDangPuPanel extends FPanel
   {
      
      public static const UI_LONGFENGDANGPU_GETDANGPU:String = "UI_LONGFENGDANGPU_GETDANGPU";
      
      public static const UI_LONGFENGDANGPU_GETSOUSUO:String = "UI_LONGFENGDANGPU_GETSOUSUO";
      
      public static const UI_LONGFENGDANGPU_GOUMAI:String = "UI_LONGFENGDANGPU_GOUMAI";
      
      private var tf:TextFormat;
      
      private var bg:DisplayObject;
      
      private var sousuo:DisplayObject;
      
      private var titleBg:DisplayObject;
      
      private var wordBg:DisplayObject;
      
      private var btnSkillArr:Array;
      
      private var btn100:NewButton;
      
      private var btn100Down:NewButton;
      
      private var btn300:NewButton;
      
      private var btn300Down:NewButton;
      
      private var btn888:NewButton;
      
      private var btn888Down:NewButton;
      
      private var btnGaoji:NewButton;
      
      private var btnGaojiDown:NewButton;
      
      private var btnTeshu:NewButton;
      
      private var btnTeshuDown:NewButton;
      
      private var btnLugong:NewButton;
      
      private var btnLugongDown:NewButton;
      
      private var btnYinCang:NewButton;
      
      private var btnYinCangDown:NewButton;
      
      private var btnSousuo:NewButton;
      
      private var btnSousuoDown:NewButton;
      
      private var btnWaizhuang:NewButton;
      
      private var btnWaizhuangDown:NewButton;
      
      private var btnYuanbao:NewButton;
      
      private var btnYuanbaoDown:NewButton;
      
      private var btnArr:Array;
      
      private var btnStrArr:Array;
      
      private var jinTiao:FTextArea;
      
      private var Spr:Sprite;
      
      private var scroll:FVScorllBar;
      
      private var Spr1:Sprite;
      
      private var scroll1:FVScorllBar;
      
      public var sousuoText:FTextInput;
      
      private var guanjianzi:FTextArea;
      
      private var sousuoBtn:SmallButton;
      
      public var miaoshu:FTextArea;
      
      private var miaoSpr:Sprite;
      
      private var miaoScroll:FVScorllBar;
      
      public var dangPu:int = 0;
      
      public function LongFengDangPuPanel()
      {
         this.btnSkillArr = [["lfdp_300_Button","lfdp_300_down_Button"],["lfdp_100_Button","lfdp_100_down_Button"],["lfdp_300_Button","lfdp_300_down_Button"],["lfdp_888_Button","lfdp_888_down_Button"],["lfdp_gaoji_Button","lfdp_gaoji_down_Button"],["lfdp_teshu_Button","lfdp_teshu_down_Button"],["lfdp_teshu_Button","lfdp_teshu_down_Button"],["lfdp_teshu_Button","lfdp_teshu_down_Button"],["lfdp_100_Button","lfdp_100_down_Button"],["lfdp_teshu_Button","lfdp_teshu_down_Button"]];
         this.btnArr = [[this.btnYuanbao,this.btnYuanbaoDown],[this.btn100,this.btn100Down],[this.btn300,this.btn300Down],[this.btn888,this.btn888Down],[this.btnGaoji,this.btnGaojiDown],[this.btnTeshu,this.btnTeshuDown],[this.btnLugong,this.btnLugongDown],[this.btnYinCang,this.btnYinCangDown],[this.btnWaizhuang,this.btnWaizhuangDown],[this.btnSousuo,this.btnSousuoDown]];
         this.btnStrArr = [LanResManager.getLanCommonTextWords("元宝"),LanResManager.getLanCommonTextWords("百元当铺"),LanResManager.getLanCommonTextWords("300元当铺"),LanResManager.getLanCommonTextWords("888元当铺"),LanResManager.getLanCommonTextWords("高级当铺"),LanResManager.getLanCommonTextWords("特殊当铺"),LanResManager.getLanCommonTextWords("鲁公秘录"),LanResManager.getLanCommonTextWords("激活隐藏"),LanResManager.getLanCommonTextWords("时装"),LanResManager.getLanCommonTextWords("搜索")];
         super();
         this.showCloseButton = true;
         this.skin = "panel";
         this.dragAble = true;
         width = 860;
         height = 635;
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.tf = new TextFormat();
         this.tf.align = "center";
         this.tf.size = 14;
         this.titleBg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/longfengdangpu/title.swf");
         this.titleBg.x = 195;
         this.titleBg.y = -80 + 35;
         addChild(this.titleBg);
         this.bg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/longfengdangpu/bg.swf");
         this.bg.x = 10;
         this.bg.y = 2;
         addChild(this.bg);
         this.sousuo = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/longfengdangpu/sousuo_up.swf");
         this.sousuo.x = 90;
         this.sousuo.y = 130;
         this.sousuo.visible = false;
         addChild(this.sousuo);
         this.wordBg = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/longfengdangpu/daojumiaoshu.swf");
         this.wordBg.x = 750;
         this.wordBg.y = 145;
         addChild(this.wordBg);
         this.jinTiao = new FTextArea();
         this.jinTiao.x = 20;
         this.jinTiao.y = 105;
         this.jinTiao.textColor = StaticValue.WHITE;
         this.jinTiao.width = 400;
         this.jinTiao.height = 20;
         this.jinTiao.text = "金条数量:0";
         addChild(this.jinTiao);
         this.Spr = new Sprite();
         addChild(this.Spr);
         this.Spr.x = 95;
         this.Spr.y = 140;
         with(this.Spr)
         {
            graphics.beginFill(16711680,0);
            graphics.drawRect(0,0,620,450);
            graphics.endFill();
         }
         this.scroll = new FVScorllBar(this.Spr,440);
         addChild(this.scroll);
         this.scroll.x = 715;
         this.scroll.y = 145;
         this.Spr1 = new Sprite();
         addChild(this.Spr1);
         this.Spr1.x = 95;
         this.Spr1.y = 190;
         with(this.Spr1)
         {
            graphics.beginFill(16711680,0);
            graphics.drawRect(0,0,620,350);
            graphics.endFill();
         }
         this.scroll1 = new FVScorllBar(this.Spr1,380);
         this.scroll1.visible = false;
         addChild(this.scroll1);
         this.scroll1.x = 715;
         this.scroll1.y = 190;
         this.miaoSpr = new Sprite();
         addChild(this.miaoSpr);
         this.miaoSpr.x = 740;
         this.miaoSpr.y = 165;
         with(this.miaoSpr)
         {
            graphics.beginFill(16711680,0);
            graphics.drawRect(0,0,110,100);
            graphics.endFill();
         }
         ToolTips.createToolTips(this.miaoSpr,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + LanResManager.getLanCommonTextWords("滚动鼠标滚轮查看物品描述。") + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.miaoScroll = new FVScorllBar(this.miaoSpr,390);
         addChild(this.miaoScroll);
         this.miaoScroll.visible = false;
         this.miaoScroll.x = 600;
         this.miaoScroll.y = 100;
         this.miaoshu = new FTextArea();
         this.miaoshu.x = 0;
         this.miaoshu.y = 0 + 20;
         this.miaoshu.multiline = true;
         this.miaoshu.textColor = StaticValue.WHITE;
         this.miaoshu.width = 110;
         this.miaoshu.height = 550;
         this.miaoshu.wordWrap = true;
         this.miaoshu.text = "";
         this.miaoSpr.addChild(this.miaoshu);
         this.sousuoBtn = new SmallButton();
         this.sousuoBtn.label = LanResManager.getLanCommonTextWords("搜索");
         this.sousuoBtn.x = this.sousuo.x + 460;
         this.sousuoBtn.y = this.sousuo.y + 20;
         addChild(this.sousuoBtn);
         this.sousuoBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.guanjianzi = new FTextArea();
         this.guanjianzi.x = this.sousuo.x + 10;
         this.guanjianzi.y = this.sousuo.y + 15;
         this.guanjianzi.defaultTextFormat = this.tf;
         this.guanjianzi.textColor = StaticValue.WHITE;
         this.guanjianzi.width = 140;
         this.guanjianzi.height = 20;
         this.guanjianzi.text = LanResManager.getLanCommonTextWords("关键字");
         addChild(this.guanjianzi);
         this.sousuoText = new FTextInput();
         this.sousuoText.textColor = 16777215;
         this.sousuoText.border = false;
         addChild(this.sousuoText);
         this.sousuoText.x = this.sousuo.x + 175;
         this.sousuoText.y = this.sousuo.y + 15;
         this.sousuoText.width = 200;
         this.sousuoText.height = 20;
         this.initBtn();
         this.setBtn(0);
      }
      
      private function initBtn() : void
      {
         var _loc2_:int = 0;
         var _loc1_:int = 0;
         while(_loc1_ < this.btnArr.length)
         {
            _loc2_ = 0;
            while(_loc2_ < this.btnArr[_loc1_].length)
            {
               this.btnArr[_loc1_][_loc2_] = new NewButton();
               this.btnArr[_loc1_][_loc2_].textFormat = this.tf;
               this.btnArr[_loc1_][_loc2_].textColor = StaticValue.BLUE;
               this.btnArr[_loc1_][_loc2_].label = this.btnStrArr[_loc1_];
               this.btnArr[_loc1_][_loc2_].setPandding(8);
               addChild(this.btnArr[_loc1_][_loc2_]);
               if(_loc2_ == 1)
               {
                  this.btnArr[_loc1_][_loc2_].visible = false;
               }
               if(_loc1_ == 6)
               {
                  (this.btnArr[_loc1_][_loc2_] as NewButton).visible = false;
               }
               if(_loc1_ > 8)
               {
                  this.btnArr[_loc1_][_loc2_].x = 15;
                  this.btnArr[_loc1_][_loc2_].y = 165 + 40 * (_loc1_ - 2);
               }
               else if(_loc1_ > 6)
               {
                  this.btnArr[_loc1_][_loc2_].x = 15;
                  this.btnArr[_loc1_][_loc2_].y = 165 + 40 * (_loc1_ - 1);
               }
               else
               {
                  this.btnArr[_loc1_][_loc2_].x = 15;
                  this.btnArr[_loc1_][_loc2_].y = 165 + 40 * _loc1_;
               }
               if(_loc1_ == 7)
               {
                  this.btnArr[_loc1_][_loc2_].y = this.btnArr[_loc1_ - 1 - 1][_loc2_].y + 40;
               }
               this.btnArr[_loc1_][_loc2_].width = 76;
               this.btnArr[_loc1_][_loc2_].height = 32;
               this.btnArr[_loc1_][_loc2_].align = "center";
               this.btnArr[_loc1_][_loc2_].setSkin(this.btnSkillArr[_loc1_][_loc2_]);
               this.btnArr[_loc1_][_loc2_].addEventListener(MouseEvent.CLICK,this.onClick);
               _loc2_++;
            }
            _loc1_++;
         }
      }
      
      public function setBtn(param1:int) : void
      {
         this.dangPu = param1 + 1;
         var _loc2_:int = 0;
         while(_loc2_ < this.btnArr.length)
         {
            this.btnArr[_loc2_][0].visible = true;
            this.btnArr[_loc2_][1].visible = false;
            if(_loc2_ == 6 || _loc2_ == 8)
            {
               this.btnArr[_loc2_][0].visible = false;
               this.btnArr[_loc2_][1].visible = false;
            }
            else if(_loc2_ == param1)
            {
               this.btnArr[_loc2_][0].visible = false;
               this.btnArr[_loc2_][1].visible = true;
            }
            _loc2_++;
         }
      }
      
      public function initItem(param1:Array) : void
      {
         var i:int;
         var h:int;
         var a:LongFengItem = null;
         var arr:Array = param1;
         while(this.Spr.numChildren > 0)
         {
            this.Spr.removeChildAt(0);
         }
         this.Spr.graphics.clear();
         this.Spr.visible = this.scroll.visible = true;
         this.Spr1.visible = this.scroll1.visible = this.sousuoText.visible = this.sousuoBtn.visible = this.sousuo.visible = this.guanjianzi.visible = false;
         i = 0;
         while(i < arr.length)
         {
            a = new LongFengItem(arr[i]);
            a.$parent = this;
            a.name = String(i);
            a.x = i % 4 * 150;
            a.y = int(i / 4) * 150;
            this.Spr.addChild(a);
            a.addEventListener(MouseEvent.CLICK,this.onAClick);
            i++;
         }
         h = 0;
         if(arr.length % 4 == 0)
         {
            h = arr.length / 4;
         }
         else
         {
            h = int(arr.length / 4) + 1;
         }
         with(this.Spr)
         {
            graphics.beginFill(16711680,0);
            graphics.drawRect(0,0,620,h * 150);
            graphics.endFill();
         }
         this.scroll.update();
      }
      
      private function onAClick(param1:MouseEvent) : void
      {
         this.miaoshu.htmlText = (param1.currentTarget as LongFengItem).good.res.desc;
         this.miaoScroll.update();
         this.miaoScroll.visible = false;
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.btnArr[0][0]:
               this.setBtn(0);
               dispatchEvent(new BaseEvent(LongFengDangPuPanel.UI_LONGFENGDANGPU_GETDANGPU,"",9));
               break;
            case this.btnArr[1][0]:
               this.setBtn(1);
               dispatchEvent(new BaseEvent(LongFengDangPuPanel.UI_LONGFENGDANGPU_GETDANGPU,"",1));
               break;
            case this.btnArr[2][0]:
               this.setBtn(2);
               dispatchEvent(new BaseEvent(LongFengDangPuPanel.UI_LONGFENGDANGPU_GETDANGPU,"",2));
               break;
            case this.btnArr[3][0]:
               this.setBtn(3);
               dispatchEvent(new BaseEvent(LongFengDangPuPanel.UI_LONGFENGDANGPU_GETDANGPU,"",3));
               break;
            case this.btnArr[4][0]:
               this.setBtn(4);
               dispatchEvent(new BaseEvent(LongFengDangPuPanel.UI_LONGFENGDANGPU_GETDANGPU,"",4));
               break;
            case this.btnArr[5][0]:
               this.setBtn(5);
               dispatchEvent(new BaseEvent(LongFengDangPuPanel.UI_LONGFENGDANGPU_GETDANGPU,"",5));
               break;
            case this.btnArr[6][0]:
               this.setBtn(6);
               dispatchEvent(new BaseEvent(LongFengDangPuPanel.UI_LONGFENGDANGPU_GETDANGPU,"",6));
               break;
            case this.btnArr[7][0]:
               this.setBtn(7);
               dispatchEvent(new BaseEvent(LongFengDangPuPanel.UI_LONGFENGDANGPU_GETDANGPU,"",7));
               break;
            case this.btnArr[8][0]:
               this.setBtn(8);
               dispatchEvent(new BaseEvent(LongFengDangPuPanel.UI_LONGFENGDANGPU_GETDANGPU,"",8));
               break;
            case this.btnArr[9][0]:
               this.setBtn(9);
               this.setSousuo();
               break;
            case this.sousuoBtn:
               dispatchEvent(new BaseEvent(LongFengDangPuPanel.UI_LONGFENGDANGPU_GETSOUSUO,"",this.sousuoText.text));
         }
      }
      
      private function setSousuo() : void
      {
         this.Spr.visible = this.scroll.visible = false;
         this.Spr1.visible = this.scroll1.visible = this.sousuoText.visible = this.sousuoBtn.visible = this.sousuo.visible = this.guanjianzi.visible = true;
      }
      
      public function initSouSuo(param1:Array) : void
      {
         var i:int;
         var h:int;
         var a:LongFengItem = null;
         var arr:Array = param1;
         while(this.Spr1.numChildren > 0)
         {
            this.Spr1.removeChildAt(0);
         }
         this.Spr1.graphics.clear();
         i = 0;
         while(i < arr.length)
         {
            a = new LongFengItem(arr[i]);
            a.$parent = this;
            a.x = i % 4 * 150;
            a.y = int(i / 4) * 150;
            this.Spr1.addChild(a);
            a.addEventListener(MouseEvent.CLICK,this.onAClick);
            i++;
         }
         h = 0;
         if(arr.length % 4 == 0)
         {
            h = arr.length / 4;
         }
         else
         {
            h = int(arr.length / 4) + 1;
         }
         with(this.Spr1)
         {
            graphics.beginFill(16711680,0);
            graphics.drawRect(0,0,620,h * 150);
            graphics.endFill();
         }
         this.scroll1.update();
      }
      
      public function upDataJintiao(param1:Number, param2:Number) : void
      {
         this.jinTiao.text = LanResManager.getLanCommonTextWords("金票数量:") + param1 + "          " + LanResManager.getLanCommonTextWords("元宝数量：") + param2;
      }
      
      private function onClose(param1:FCloseEvent = null) : void
      {
         if(parent != null)
         {
            parent.removeChild(this);
         }
      }
   }
}

