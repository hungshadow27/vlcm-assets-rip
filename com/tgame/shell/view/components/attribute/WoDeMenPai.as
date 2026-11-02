package com.tgame.shell.view.components.attribute
{
   import br.com.stimuli.loading.loadingtypes.LoadingItem;
   import com.fireice.button.FSimpleButton;
   import com.fireice.list.FList;
   import com.fireice.panel.FCanvas;
   import com.fireice.scroll.FVScorllBar;
   import com.fireice.text.FTextArea;
   import com.fireice.text.FTextInput;
   import com.fireice.util.F9GridBitmap;
   import com.fireice.util.Tools;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.GameState;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.staticdata.SpecialGoodsID;
   import com.tgame.common.ui.componets.*;
   import com.tgame.common.utils.LoadSwf;
   import com.tgame.moudels.woDeMenPai.view.MenPai;
   import com.tgame.shell.view.components.CharAttribute;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.manager.LoaderManager;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.FocusEvent;
   import flash.events.MouseEvent;
   import flash.text.*;
   
   public class WoDeMenPai extends Sprite
   {
      
      public var nameInput:FTextInput;
      
      private var createBtn:FSimpleButton;
      
      private var menPaiData:MenPai;
      
      private var zhaoMuBtn:FSimpleButton;
      
      private var titleFta:FTextArea;
      
      private var titleFta2:FTextArea;
      
      public var $parent:DisplayObject;
      
      public var menPaiName:FTextArea;
      
      public var zuShiName:FTextArea;
      
      public var gradeFta:FTextArea;
      
      public var gongXianFta:FTextArea;
      
      public var dateFta:FTextArea;
      
      public var tipsFta:FTextArea;
      
      private var listContainer:Sprite;
      
      private var diziList:FList;
      
      private var scroll:FVScorllBar;
      
      private var gongXianBtn:SmallButton;
      
      private var chuZhanBtn:SmallButton;
      
      private var chuanGongBtn:SmallButton;
      
      private var diZiid:int = 0;
      
      private var menpaidiziList:MenPaiDiZiList;
      
      private var dizigongxian:DiZiGongXian;
      
      private var nameBg:F9GridBitmap;
      
      private var _avatar:Bitmap;
      
      private var bg1:DisplayObject;
      
      private var bg2:DisplayObject;
      
      private var menMc:MovieClip;
      
      private var tipCanvas:FCanvas;
      
      private var tip:FTextArea;
      
      private var starSpr:Sprite;
      
      private var starMc:MovieClip;
      
      private var starSta:int = 0;
      
      private var jinshenBo:Boolean = false;
      
      private var xieliBo:Boolean = false;
      
      private var liantijiBo:Boolean = false;
      
      public function WoDeMenPai()
      {
         super();
         this.tipCanvas = new FCanvas();
         this.tipCanvas.skin = "backGroud";
         this.tip = new FTextArea();
         with(this.tip)
         {
            x = 2;
            y = 2;
            autoSize = TextFieldAutoSize.LEFT;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
         }
         this.tipCanvas.addChild(this.tip);
         this.bg1 = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/woDeMenPai/bg1.swf");
         this.bg1.x = 0;
         this.bg1.y = 0;
         addChild(this.bg1);
         this.bg2 = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/woDeMenPai/bg2.swf");
         this.bg2.x = 0;
         this.bg2.y = 0;
         addChild(this.bg2);
         this._avatar = new Bitmap();
         this._avatar.x = -173;
         this._avatar.y = 107;
         addChild(this._avatar);
         this.listContainer = new Sprite();
         addChild(this.listContainer);
         with(this.listContainer)
         {
            x = 146;
            y = 48;
            graphics.beginFill(16711680,0);
            graphics.drawRect(0,0,315,280);
            graphics.endFill();
         }
         this.diziList = new FList();
         this.diziList.skin = "list";
         this.diziList.itemRenderer = new MenPaiDiZiList();
         this.diziList.listWidth = 300 + 16;
         this.listContainer.addChild(this.diziList);
         this.diziList.x = 10;
         this.diziList.y = 0;
         this.diziList.addEventListener(MouseEvent.CLICK,this.onListClick);
         this.scroll = new FVScorllBar(this.diziList,300 + 16);
         this.scroll.x = 61 + 10 + 390;
         this.scroll.y = 28 + 15;
         this.titleFta = new FTextArea();
         with(this.titleFta)
         {
            multiline = true;
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            x = 20;
            y = 4;
            textColor = StaticValue.BlUE20;
            htmlText = "<textformat leading=\'2\'>" + LanResManager.getLanCommonTextWords("门派名称:") + "                                       " + LanResManager.getLanCommonTextWords("门派祖师:") + "                                 " + LanResManager.getLanCommonTextWords("门派等级:") + "<br>" + "                                           " + LanResManager.getLanCommonTextWords("成立日期:") + "</textformat>";
         }
         addChild(this.titleFta);
         this.titleFta2 = new FTextArea();
         with(this.titleFta2)
         {
            multiline = true;
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            x = 20;
            y = 22;
            textColor = StaticValue.BlUE20;
            htmlText = "<textformat leading=\'6\'>" + LanResManager.getLanCommonTextWords("门派贡献:") + "</textformat>";
         }
         this.titleFta2.addEventListener(MouseEvent.MOUSE_OVER,this.onMouseTip);
         this.titleFta2.addEventListener(MouseEvent.MOUSE_OUT,this.onMouseTip);
         this.menPaiName = new FTextArea();
         this.menPaiName.x = 80 - 30;
         this.menPaiName.y = 4;
         this.menPaiName.filters = StaticValue.filter;
         this.menPaiName.textColor = StaticValue.GREEN;
         this.menPaiName.text = LanResManager.getLanCommonTextWords("门派名称7个字");
         addChild(this.menPaiName);
         this.zuShiName = new FTextArea();
         with(this.zuShiName)
         {
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            x = 250 - 40;
            y = 4;
            textColor = StaticValue.GREEN;
            htmlText = "<textformat leading=\'6\'>" + LanResManager.getLanCommonTextWords("祖师名称7个字") + "</textformat>";
         }
         addChild(this.zuShiName);
         this.gradeFta = new FTextArea();
         with(this.gradeFta)
         {
            multiline = true;
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            x = 420 - 60;
            y = 4;
            textColor = StaticValue.WHITE;
            htmlText = "<textformat leading=\'6\'>" + "20" + "</textformat>";
         }
         addChild(this.gradeFta);
         this.gongXianFta = new FTextArea();
         with(this.gongXianFta)
         {
            multiline = true;
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            x = 80;
            y = 22;
            textColor = StaticValue.WHITE;
            htmlText = "<textformat leading=\'6\'>" + "2000000" + "</textformat>";
         }
         this.dateFta = new FTextArea();
         with(this.dateFta)
         {
            multiline = true;
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            x = 250 - 40;
            y = 22;
            textColor = StaticValue.WHITE;
            htmlText = "<textformat leading=\'6\'>" + LanResManager.getLanCommonTextWords("2014年1月2日") + "</textformat>";
         }
         addChild(this.dateFta);
         this.tipsFta = new FTextArea();
         with(this.tipsFta)
         {
            multiline = true;
            filters = StaticValue.filter;
            autoSize = TextFieldAutoSize.LEFT;
            wordWrap = true;
            x = 10;
            y = 260;
            width = 130;
            textColor = StaticValue.WHITE;
            htmlText = "<textformat leading=\'6\'>" + LanResManager.getLanCommonTextWords("注：玩家可以在蜕变后的弟子与角色之间，通过鼠标右键切换操作，只有出战的弟子才可以切换") + "</textformat>";
         }
         addChild(this.tipsFta);
         this.zhaoMuBtn = new FSimpleButton();
         this.zhaoMuBtn.skin = "zhaoMuButton";
         addChild(this.zhaoMuBtn);
         this.zhaoMuBtn.x = 265;
         this.zhaoMuBtn.y = 32;
         this.zhaoMuBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.gongXianBtn = new SmallButton();
         this.gongXianBtn.label = LanResManager.getLanCommonTextWords("贡献");
         this.gongXianBtn.x = 200 + 10;
         this.gongXianBtn.y = 338;
         this.gongXianBtn.toolTip = "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("每天晚上0点整贡献度将会进行消耗处理，每次消耗贡献金的0.5%") + "<br>" + LanResManager.getLanCommonTextWords("（贡献度不可以提升永久属性）") + "</font>";
         this.gongXianBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.chuanGongBtn = new SmallButton();
         this.chuanGongBtn.label = LanResManager.getLanCommonTextWords("传功");
         addChild(this.chuanGongBtn);
         this.chuanGongBtn.x = 200 + 100;
         this.chuanGongBtn.y = 338;
         this.chuanGongBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.chuZhanBtn = new SmallButton();
         this.chuZhanBtn.label = LanResManager.getLanCommonTextWords("出战");
         addChild(this.chuZhanBtn);
         this.chuZhanBtn.x = 200 + 180;
         this.chuZhanBtn.y = 338;
         this.chuZhanBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.nameBg = Tools.get9GridBitmpByName("countBg");
         addChild(this.nameBg);
         this.nameBg.width = 140;
         this.nameBg.x = 178;
         this.nameBg.y = 111;
         this.nameInput = new FTextInput();
         with(this.nameInput)
         {
            x = 180;
            y = 112;
            width = 140;
            height = 20;
            textColor = StaticValue.WHITE;
            text = LanResManager.getLanCommonTextWords("请输入你要创建门派名称");
         }
         this.nameInput.setMaxChars(12);
         addChild(this.nameInput);
         this.nameInput.addEventListener(FocusEvent.FOCUS_IN,this.onFocus);
         this.nameInput.addEventListener(FocusEvent.FOCUS_OUT,this.onFocus);
         this.createBtn = new FSimpleButton();
         this.createBtn.skin = "createCharBtn_cg";
         addChild(this.createBtn);
         this.createBtn.x = 200;
         this.createBtn.y = 185;
         this.createBtn.addEventListener(MouseEvent.CLICK,this.onCreate);
         this.starSpr = new Sprite();
         this.starSpr.x = 375 + 73;
         this.starSpr.y = 25 - 2;
         this.starSpr.addEventListener(MouseEvent.MOUSE_OVER,this.onStarMouseTip);
         this.starSpr.addEventListener(MouseEvent.MOUSE_OUT,this.onStarMouseTip);
      }
      
      private function onMouseTip(param1:MouseEvent) : void
      {
         switch(param1.type)
         {
            case MouseEvent.MOUSE_OVER:
               this.titleFta2.addEventListener(MouseEvent.MOUSE_MOVE,this.onMouseTip);
               break;
            case MouseEvent.MOUSE_MOVE:
               this.showTip(LanResManager.getLanCommonTextWords("每天晚上0点整贡献度将会进行消耗处理，每次消耗贡献金的0.5%") + "<br>" + LanResManager.getLanCommonTextWords("（贡献度不可以提升永久属性）"));
               break;
            case MouseEvent.MOUSE_OUT:
               if(this.tipCanvas.parent != null)
               {
                  this.tipCanvas.parent.removeChild(this.tipCanvas);
               }
               this.titleFta2.removeEventListener(MouseEvent.MOUSE_MOVE,this.onMouseTip);
         }
      }
      
      private function onStarMouseTip(param1:MouseEvent) : void
      {
         var _loc2_:String = null;
         switch(param1.type)
         {
            case MouseEvent.MOUSE_OVER:
               this.starSpr.addEventListener(MouseEvent.MOUSE_MOVE,this.onStarMouseTip);
               break;
            case MouseEvent.MOUSE_MOVE:
               _loc2_ = "";
               if(!this.jinshenBo)
               {
                  _loc2_ += "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("师徒同心") + "<br>" + LanResManager.getLanCommonTextWords("属性提升：攻击：18888亿、防御16888亿、血量20888亿、所有武功提升 120000层") + "<br>" + LanResManager.getLanCommonTextWords("金身（特殊技能）：当玩家使用右键进行切换到弟子人物时，将自动触发金身状态，抵抗一切伤害，弟") + "<br>" + LanResManager.getLanCommonTextWords("子将无敌3秒，且在此状态下，每次攻击都将造成对手额外70%的当前血量伤害。金身冷却时间为60秒!") + "<br></font>";
               }
               else
               {
                  _loc2_ += "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("师徒同心") + "<br>" + LanResManager.getLanCommonTextWords("属性提升：攻击：18888亿、防御16888亿、血量20888亿、所有武功提升 120000层") + "<br>" + LanResManager.getLanCommonTextWords("金身（特殊技能）：当玩家使用右键进行切换到弟子人物时，将自动触发金身状态，抵抗一切伤害，弟") + "<br>" + LanResManager.getLanCommonTextWords("子将无敌3秒，且在此状态下，每次攻击都将造成对手额外70%的当前血量伤害。金身冷却时间为60秒!") + "<br></font>";
               }
               if(!this.xieliBo)
               {
                  _loc2_ += "<font color=\'" + StaticValue.WHITE_HTML + "\'>" + LanResManager.getLanCommonTextWords("师徒同心【协力】") + "<br>" + LanResManager.getLanCommonTextWords("属性提升：攻击5688888888900防御4288888888900 血量6088888888900暴击 88888闪避88888 所有武功1000000层") + "<br>" + LanResManager.getLanCommonTextWords("协力（特殊技能）：当玩家自身出战时，在PK过程中死亡后，将会自动切换至弟子状态，继续战斗！") + "<br></font>";
               }
               else
               {
                  _loc2_ += "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("师徒同心【协力】") + "<br>" + LanResManager.getLanCommonTextWords("属性提升：攻击5688888888900防御4288888888900 血量6088888888900暴击 88888闪避88888 所有武功1000000层") + "<br>" + LanResManager.getLanCommonTextWords("协力（特殊技能）：当玩家自身出战时，在PK过程中死亡后，将会自动切换至弟子状态，继续战斗！") + "<br></font>";
               }
               if(this.liantijiBo)
               {
                  _loc2_ += "<font color=\'" + StaticValue.GREEN_HTML + "\'>" + LanResManager.getLanCommonTextWords("师徒连体技") + "<br>" + LanResManager.getLanCommonTextWords("当玩家自身的血量降低30%时，100%触发连技金身效果，自身和弟子同时产生金身护体，5秒内金身庇护，无敌模") + "<br>" + LanResManager.getLanCommonTextWords("式。冷却90秒。") + "</font>";
               }
               this.showTip(_loc2_);
               break;
            case MouseEvent.MOUSE_OUT:
               if(this.tipCanvas.parent != null)
               {
                  this.tipCanvas.parent.removeChild(this.tipCanvas);
               }
               this.starSpr.removeEventListener(MouseEvent.MOUSE_MOVE,this.onStarMouseTip);
         }
      }
      
      private function showTip(param1:String) : void
      {
         this.tip.htmlText = param1;
         addChild(this.tipCanvas);
         this.tipCanvas.width = this.tip.width + 4;
         this.tipCanvas.height = this.tip.height + 4;
         this.tipCanvas.x = mouseX + 15;
         this.tipCanvas.y = mouseY + 25;
      }
      
      public function set setParent(param1:DisplayObject) : void
      {
         this.$parent = param1;
         MenPaiDiZiList.$parent = param1;
      }
      
      public function set avatar(param1:BitmapData) : void
      {
         this._avatar.bitmapData = param1;
         if(!param1)
         {
            return;
         }
         this._avatar.x = 220 - this._avatar.width / 2 - 170 + 20;
         this._avatar.y = 135 - this._avatar.height + 20 + 60;
      }
      
      public function setWoDeMenPaiInit(param1:Boolean, param2:MenPai) : void
      {
         MenPaiDiZiList.isMain = param1;
         if(param2)
         {
            this.bg1.visible = false;
            this.bg2.visible = true;
            this.nameInput.visible = false;
            this.createBtn.visible = false;
            this.nameBg.visible = false;
            this.menPaiName.visible = true;
            this.zuShiName.visible = true;
            this.gradeFta.visible = true;
            this.dateFta.visible = true;
            this.tipsFta.visible = true;
            this.gongXianFta.visible = true;
            this.titleFta.visible = true;
            this.titleFta2.visible = true;
            this.diziList.visible = true;
            this.zhaoMuBtn.visible = true;
            this.gongXianBtn.visible = true;
            this.chuanGongBtn.visible = true;
            this.chuZhanBtn.visible = true;
            this._avatar.visible = true;
            this.menPaiName.text = param2.name;
            this.zuShiName.text = param2.zuShiName;
            this.gradeFta.text = "" + param2.grade;
            this.dateFta.htmlText = param2.createDate.fullYear + LanResManager.getLanCommonTextWords("年") + (param2.createDate.month + 1) + LanResManager.getLanCommonTextWords("月") + param2.createDate.date + LanResManager.getLanCommonTextWords("日");
            this.gongXianFta.text = "" + param2.gongXianZhi;
            this.menPaiData = param2;
            this.diziList.dataProvider = param2.diZiDataArr;
            if(param2.diZiDataArr.length > 0)
            {
               this.diziList.setSelectItemByIndex(0);
               this.onListClick();
            }
            if(param2.diZiDataArr.length < 4)
            {
               this.zhaoMuBtn.y = 65 + param2.diZiDataArr.length * 73;
               this.zhaoMuBtn.visible = true;
            }
            else
            {
               this.zhaoMuBtn.visible = false;
            }
         }
         else
         {
            this.bg1.visible = true;
            this.bg2.visible = false;
            this.nameInput.visible = true;
            this.createBtn.visible = true;
            this.nameBg.visible = true;
            this.menPaiName.visible = false;
            this.zuShiName.visible = false;
            this.gradeFta.visible = false;
            this.dateFta.visible = false;
            this.tipsFta.visible = false;
            this.gongXianFta.visible = false;
            this.titleFta.visible = false;
            this.titleFta2.visible = false;
            this.diziList.visible = false;
            this.zhaoMuBtn.visible = false;
            this.gongXianBtn.visible = false;
            this.chuanGongBtn.visible = false;
            this.chuZhanBtn.visible = false;
            this._avatar.visible = false;
            this.nameInput.text = LanResManager.getLanCommonTextWords("请输入你要创建门派名称");
         }
         this.setJiHuo(param1);
      }
      
      public function setJiHuo(param1:Boolean) : void
      {
         if(param1)
         {
            this.jinshenBo = GameState.dictMainStatus[SpecialGoodsID.MENPAI_SHITUTONGXIN_ID];
            this.xieliBo = GameState.dictMainStatus[SpecialGoodsID.MENPAI_SHITUTONGXIN_XIELI_ID];
            this.liantijiBo = GameState.dictMainStatus[SpecialGoodsID.MENPAI_SHITULIANTIJI_ID];
         }
         else
         {
            this.jinshenBo = GameState.dictTargetStatus[SpecialGoodsID.MENPAI_SHITUTONGXIN_ID];
            this.xieliBo = GameState.dictTargetStatus[SpecialGoodsID.MENPAI_SHITUTONGXIN_XIELI_ID];
            this.liantijiBo = GameState.dictTargetStatus[SpecialGoodsID.MENPAI_SHITULIANTIJI_ID];
         }
         if(this.jinshenBo || this.xieliBo || this.liantijiBo)
         {
            this.starSta = 1;
         }
         else
         {
            this.starSta = 0;
         }
         this.setStarSta(this.starSta);
      }
      
      private function onFocus(param1:FocusEvent) : void
      {
         if(param1.type == FocusEvent.FOCUS_IN)
         {
            switch(param1.target)
            {
               case this.nameInput:
                  this.nameInput.text = "";
            }
         }
         else if(param1.type == FocusEvent.FOCUS_OUT)
         {
            switch(param1.target)
            {
               case this.nameInput:
                  if(this.nameInput.text == "")
                  {
                     this.nameInput.text = LanResManager.getLanCommonTextWords("请输入你要创建门派名称");
                  }
            }
         }
      }
      
      private function onListClick(param1:MouseEvent = null) : void
      {
         if(this.diziList.selectItem == null)
         {
            return;
         }
         this.diZiid = this.diziList.selectItem.id;
         if(this.diziList.selectItem.isChuZhan)
         {
            this.chuZhanBtn.label = LanResManager.getLanCommonTextWords("休息");
         }
         else
         {
            this.chuZhanBtn.label = LanResManager.getLanCommonTextWords("出战");
         }
      }
      
      private function onCreate(param1:Event) : void
      {
         this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_WUDEMENPAI_CREATE_CLICK,"",this.nameInput.text));
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         switch(param1.target)
         {
            case this.zhaoMuBtn:
               this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_WUDEMENPAI_TUIBIAN_CLICK));
               break;
            case this.chuanGongBtn:
               this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_WUDEMENPAI_CHUANGONG_CLICK));
               break;
            case this.chuZhanBtn:
               if(Boolean(this.menPaiData) && Boolean(this.diziList != null) && this.diziList.selectItem != null)
               {
                  if(this.chuZhanBtn.label == LanResManager.getLanCommonTextWords("出战"))
                  {
                     this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_WUDEMENPAI_CHUZHAN_CLICK,"",[this.diziList.selectItem.id,0]));
                  }
                  else if(this.chuZhanBtn.label == LanResManager.getLanCommonTextWords("休息"))
                  {
                     this.$parent.dispatchEvent(new BaseEvent(CharAttribute.UI_WUDEMENPAI_CHUZHAN_CLICK,"",[this.diziList.selectItem.id,1]));
                  }
               }
               break;
            case this.gongXianBtn:
               this.showPan();
         }
      }
      
      public function showPan() : void
      {
         if(!this.dizigongxian)
         {
            this.dizigongxian = new DiZiGongXian();
            this.dizigongxian.$parent = this.$parent;
         }
         this.dizigongxian.x = (GameConfig.sceneWidth - this.dizigongxian.width) / 2;
         this.dizigongxian.y = (GameConfig.sceneHeight - this.dizigongxian.height) / 2;
         GameInstance.uiInstance.uiContainer.addChild(this.dizigongxian);
      }
      
      public function setEnableFun() : void
      {
         this.chuZhanBtn.enabled = false;
         this.gongXianBtn.enabled = false;
         this.chuanGongBtn.enabled = false;
         this.createBtn.enabled = false;
         this.zhaoMuBtn.enabled = false;
         this.listContainer.mouseEnabled = false;
      }
      
      public function showMen() : void
      {
         var loadUrl:String = null;
         if(this.menMc != null)
         {
            this.bg1.visible = false;
            if(this.menMc.parent == null)
            {
               addChild(this.menMc);
               this.menMc.x = 2;
               this.menMc.y = 4;
               this.menMc.addEventListener(Event.ENTER_FRAME,this.onComplete);
            }
            this.menMc.gotoAndPlay(0);
         }
         else
         {
            loadUrl = GameConfig.fileBaseFolder + "res/ui/UIditu/woDeMenPai/men.swf";
            LoaderManager.lazyLoad(function(param1:Event):void
            {
               var _loc2_:LoadingItem = param1.target as LoadingItem;
               if(_loc2_.url.url != loadUrl)
               {
                  return;
               }
               if(Boolean(menMc) && menMc.parent != null)
               {
                  menMc.stop();
                  menMc.parent.removeChild(menMc);
               }
               menMc = _loc2_.content as MovieClip;
               if(menMc)
               {
                  bg1.visible = false;
                  menMc.play();
                  menMc.addEventListener(Event.ENTER_FRAME,onComplete);
                  addChild(menMc);
                  menMc.x = 2;
                  menMc.y = 4;
               }
            },null,false,loadUrl);
         }
      }
      
      private function onComplete(param1:Event) : void
      {
         if(Boolean(this.menMc) && Boolean(this.menMc.parent != null) && this.menMc.currentFrame == this.menMc.totalFrames - 2)
         {
            this.menMc.stop();
            this.menMc.removeEventListener(Event.ENTER_FRAME,this.onComplete);
            this.menMc.parent.removeChild(this.menMc);
            this.$parent.dispatchEvent(new BaseEvent(CharAttribute.WODEMENPAI));
         }
      }
      
      public function setStarSta(param1:int) : void
      {
         var bmp:Bitmap = null;
         var loadUrl:String = null;
         var type:int = param1;
         while(this.starSpr.numChildren > 0)
         {
            this.starSpr.removeChildAt(0);
         }
         this.starSta = type;
         if(this.starSta >= 1)
         {
            if(this.starMc == null)
            {
               loadUrl = GameConfig.fileBaseFolder + "res/data/mc/longhun/fire.swf";
               LoaderManager.lazyLoad(function(param1:Event):void
               {
                  var _loc2_:LoadingItem = param1.target as LoadingItem;
                  starMc = _loc2_.content as MovieClip;
                  if(starMc)
                  {
                     starMc.x = -19;
                     starMc.y = -41;
                     starSpr.addChild(starMc);
                  }
               },null,false,loadUrl);
            }
            else
            {
               this.starSpr.addChild(this.starMc);
            }
            bmp = StaticValue.getBitmapByClassName("ui.biwuDahui.star.liang");
            this.starSpr.addChild(bmp);
         }
         else
         {
            bmp = StaticValue.getBitmapByClassName("ui.biwuDahui.star.an");
            this.starSpr.addChild(bmp);
         }
      }
   }
}

