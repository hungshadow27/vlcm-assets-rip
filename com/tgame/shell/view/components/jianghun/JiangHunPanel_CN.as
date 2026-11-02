package com.tgame.shell.view.components.jianghun
{
   import br.com.stimuli.loading.loadingtypes.LoadingItem;
   import com.fireice.checkBox.FCheckBox;
   import com.fireice.text.FTextArea;
   import com.fireice.util.Tools;
   import com.tgame.PipeConstants;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.GameState;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.staticdata.ItemPositionRange;
   import com.tgame.common.staticdata.SpecialGoodsID;
   import com.tgame.common.ui.componets.BasePanel;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.ui.componets.NewButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.utils.LoadSwf;
   import com.tgame.common.utils.ToolTips;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.common.vo.item.Skill;
   import com.tgame.manager.PipeManager;
   import com.tgame.shell.view.components.moshouzhanchang.NewLoadingBarCanver;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.manager.LoaderManager;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.utils.setTimeout;
   import game.display.Button;
   import game.display.Image;
   import game.display.Label;
   import game.display.RadioButton;
   import game.display.RadioButtonGroup;
   import game.display.SimpleButton;
   import game.skin.SanGuoJiangHunYueNanSkin;
   import game.utils.SkinTools;
   
   public class JiangHunPanel_CN extends BasePanel
   {
      
      public static const JIANGHUN_CLICK:String = "JIANGHUN_CLICK";
      
      public static const JIANGHUN_JIHUO_CLICK:String = "JIANGHUN_JIHUO_CLICK";
      
      public static const JIANGHUN_CHUANZHAN_CLICK:String = "JIANGHUN_CHUANZHAN_CLICK";
      
      public static const JIANGHUN_XIAOHAO_CLICK:String = "JIANGHUN_XIAOHAO_CLICK";
      
      public static const JIANGHUN_ZHURU_CLICK:String = "JIANGHUN_ZHURU_CLICK";
      
      public static const UI_JIANGHUN_MENU_SHOW:String = "UI_JIANGHUN_MENU_SHOW";
      
      private var effectContainer:Sprite;
      
      private var boxContainer:Sprite;
      
      private var imgBtnSprite:Sprite;
      
      private var btnClose:SimpleButton;
      
      private var btnZuo:SimpleButton;
      
      private var btnYou:SimpleButton;
      
      private var btnJiHuo:SimpleButton;
      
      private var btnXiuXi:SimpleButton;
      
      private var btnChuZhan:SimpleButton;
      
      private var btnZhuRu:Button;
      
      private var btnZiDong:Button;
      
      private var btnTingZhi:Button;
      
      private var btnJiangHun:RadioButton;
      
      private var btnShengWang:RadioButton;
      
      private var txtMiaoShu:Label;
      
      private var txtBenCi:Label;
      
      private var txtShengYu:Label;
      
      private var imgBtn:DisplayObject;
      
      private var imgName:DisplayObject;
      
      private var imgRank1:DisplayObject;
      
      private var imgRank2:DisplayObject;
      
      private var imgRank3:DisplayObject;
      
      private var itemEquip1:Image;
      
      private var itemEquip2:Image;
      
      private var itemEquip3:Image;
      
      private var itemEquip4:Image;
      
      private var itemSkill1:Image;
      
      private var itemSkill2:Image;
      
      private var itemSkill3:Image;
      
      private var itemSkill4:Image;
      
      private var imgYinHun1:Image;
      
      private var imgYinHun2:Image;
      
      private var imgYinHun3:Image;
      
      private var imgYinHun4:Image;
      
      private var imgYinHun5:Image;
      
      private var imgYinHun6:Image;
      
      private var imgYinHun7:Image;
      
      private var imgYinHun8:Image;
      
      private var imgYinHun9:Image;
      
      private var imgYinHun10:Image;
      
      private var imgYangHun1:Image;
      
      private var imgYangHun2:Image;
      
      private var imgYangHun3:Image;
      
      private var imgYangHun4:Image;
      
      private var imgYangHun5:Image;
      
      private var imgYangHun6:Image;
      
      private var imgYangHun7:Image;
      
      private var imgYangHun8:Image;
      
      private var imgYangHun9:Image;
      
      private var imgYangHun10:Image;
      
      private var newLoadingBarCanver:NewLoadingBarCanver;
      
      private var newLoadingBarCanver1:NewLoadingBarCanver;
      
      private var arrBtn:Array;
      
      private var ftZhaoYun1:FTextArea;
      
      private var checkZhaoYun1:FCheckBox;
      
      private var ftZhaoYun2:FTextArea;
      
      private var checkZhaoYun2:FCheckBox;
      
      private var ftZhaoYun3:FTextArea;
      
      private var checkZhaoYun3:FCheckBox;
      
      private var isZiDong:Boolean;
      
      private var currWuIndex:int = 0;
      
      private var currPage:int = 0;
      
      private var typeXiaoHao:int = 0;
      
      private var currIndex:int = 0;
      
      private var arrWu:Array;
      
      private var equipContainers:Sprite;
      
      public function JiangHunPanel_CN()
      {
         var i:int;
         var btnWu:NewButton = null;
         super();
         this.skin = SkinTools.getChildSkinByName(SanGuoJiangHunYueNanSkin.skin,"jianghun");
         this.newLoadingBarCanver = new NewLoadingBarCanver();
         this.newLoadingBarCanver.setSkin(GameConfig.fileBaseFolder + "res/ui/UIditu/jianghun/bar_down_1.swf",GameConfig.fileBaseFolder + "res/ui/UIditu/jianghun/bar_up_1.swf",168,17);
         this.newLoadingBarCanver.x = 652 - 15;
         this.newLoadingBarCanver.y = 364;
         addChild(this.newLoadingBarCanver);
         this.newLoadingBarCanver1 = new NewLoadingBarCanver();
         this.newLoadingBarCanver1.setSkin(GameConfig.fileBaseFolder + "res/ui/UIditu/jianghun/bar_down_1.swf",GameConfig.fileBaseFolder + "res/ui/UIditu/jianghun/bar_up_2.swf",168,17);
         this.newLoadingBarCanver1.x = 652 - 15;
         this.newLoadingBarCanver1.y = 364;
         addChild(this.newLoadingBarCanver1);
         this.effectContainer = new Sprite();
         addChild(this.effectContainer);
         this.effectContainer.mouseEnabled = false;
         this.effectContainer.mouseChildren = false;
         this.boxContainer = new Sprite();
         addChild(this.boxContainer);
         this.imgBtnSprite = new Sprite();
         addChild(this.imgBtnSprite);
         this.imgBtnSprite.mouseEnabled = false;
         this.imgBtnSprite.mouseChildren = false;
         this.equipContainers = new Sprite();
         addChild(this.equipContainers);
         this.equipContainers.addEventListener(MouseEvent.MOUSE_UP,this.onItemClick00,false,30);
         this.arrBtn = new Array();
         i = 0;
         while(i < 9)
         {
            btnWu = new NewButton();
            btnWu.x = 45 + i * 85;
            btnWu.y = 52;
            btnWu.width = 80;
            btnWu.align = "center";
            addChild(btnWu);
            this.arrBtn.push(btnWu);
            btnWu.addEventListener(MouseEvent.CLICK,this.onClickWuHunHandler);
            i++;
         }
         this.ftZhaoYun1 = new FTextArea();
         this.ftZhaoYun1.x = 20;
         this.ftZhaoYun1.y = 170;
         this.ftZhaoYun1.textColor = StaticValue.GREEN;
         this.ftZhaoYun1.width = 80;
         this.ftZhaoYun1.height = 20;
         this.ftZhaoYun1.htmlText = "雪花乱舞";
         addChild(this.ftZhaoYun1);
         ToolTips.createToolTips(this.ftZhaoYun1,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + "特殊技能： 战斗时100%触发雪花乱舞，持续15秒；施展雪花乱舞，自身将会被雪花包围，抵御一切伤害，" + "<br>" + "寒气每次使对手受到伤害时，将会延缓对手的动作并不能跳跃，且雪花寒气限制其对手的内力的恢复，不" + "<br>" + "断的使对手丧失行动能力，直至被寒气封住穴脉，无法使用任何技能，并每秒冻住对手身上80%生命，且" + "<br>" + "雪花领域内的对手将会一直无法看到任何其他人。冷却60秒。" + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.ftZhaoYun2 = new FTextArea();
         this.ftZhaoYun2.x = 20;
         this.ftZhaoYun2.y = 185;
         this.ftZhaoYun2.textColor = StaticValue.GREEN;
         this.ftZhaoYun2.width = 80;
         this.ftZhaoYun2.height = 20;
         this.ftZhaoYun2.htmlText = "七探无形剑";
         addChild(this.ftZhaoYun2);
         ToolTips.createToolTips(this.ftZhaoYun2,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + "特殊技能： 战斗时100%触发七探无形剑，持续15秒；自身在受到攻击时，将会立即使对手被限制在原地，" + "<br>" + "无法跳跃躲避，同时瞬间使用剑气削去对手的80%的生命，且在被剑气束缚时，对手将无法使用一切的武" + "<br>" + "功，且对手每次移动都将会被无形剑所阻扰，每次走动必定被击回原地；且命中无影剑时，无法看清任何" + "<br>" + "事物，并攻速移速下降至1点。冷却60秒。" + "<br>";
            return _loc1_ + "</textformat>";
         });
         this.ftZhaoYun3 = new FTextArea();
         this.ftZhaoYun3.x = 20;
         this.ftZhaoYun3.y = 203;
         this.ftZhaoYun3.textColor = StaticValue.GREEN;
         this.ftZhaoYun3.width = 80;
         this.ftZhaoYun3.height = 20;
         this.ftZhaoYun3.htmlText = "赵云将魂神通";
         addChild(this.ftZhaoYun3);
         ToolTips.createToolTips(this.ftZhaoYun3,this,function():String
         {
            var _loc1_:String = "";
            _loc1_ += "<textformat leading=\'6\'>";
            _loc1_ += "<font color=\'StaticValue.WHITE_HTML\'>" + "特殊技能：战斗时100%触发赵云将魂神通，持续15秒；自身获得赵云形化，被自身攻击命中的对手都将" + "<br>" + "立即禁武且限制在原地；且自身每次闪动将会留下青虹残影，任何人只可锁定青虹残影，无法锁定到自身" + "<br>" + "本体，且自身每次攻击都将附带将魂神通，使对手眼前一片黑暗，每次移动或躲避都将会导致其生命瞬间" + "<br>" + "下降至20%，且自身神通每次命中都将会使自身瞬间召唤将魂守护光环，使自身一直保持无敌状态，且所" + "<br>" + "有伤害与负面都将无法临身。冷却30秒。" + "<br>" + "将魂神通：自身攻击或受到攻击都将会撕开时空长河，使自身隐藏在里面无法被人看到，每次攻击对手都" + "<br>" + "将会导致对手受到时空长河的影响直接魂魄飞离，直接定在原地。且时间长河不断的削弱对手的寿命，每" + "<br>" + "次削弱都将会掉落80%的生命，持续15秒。冷却30秒。" + "<br>";
            return _loc1_ + "</textformat>";
         });
      }
      
      private function setJiHuo() : void
      {
         if(this.currPage == 1)
         {
            this.ftZhaoYun1.visible = GameState.dictMainStatus[SpecialGoodsID.LINGSHUGONGYANG_XUEHUALUANWU];
            this.ftZhaoYun2.visible = GameState.dictMainStatus[SpecialGoodsID.LINGSHUGONGYANG_QITANWUXINGJIAN];
            this.ftZhaoYun3.visible = GameState.dictMainStatus[SpecialGoodsID.LINGSHUGONGYANG_ZHAOYUNSHENTONG];
         }
         else
         {
            this.ftZhaoYun1.visible = false;
            this.ftZhaoYun2.visible = false;
            this.ftZhaoYun3.visible = false;
         }
      }
      
      private function onItemClick00(param1:MouseEvent) : void
      {
         dispatchEvent(new BaseEvent(JiangHunPanel_CN.UI_JIANGHUN_MENU_SHOW,"",param1));
      }
      
      override protected function createVariableReference() : void
      {
         this.btnClose = getChildByName("guanbi") as SimpleButton;
         this.btnClose.addEventListener(MouseEvent.CLICK,this.onCloseHandler);
         this.btnZuo = getChildByName("zuoyouanniu1") as SimpleButton;
         this.btnZuo.addEventListener(MouseEvent.CLICK,this.onClickHandler);
         this.btnYou = getChildByName("zuoyouanniu2") as SimpleButton;
         this.btnYou.addEventListener(MouseEvent.CLICK,this.onClickHandler);
         this.btnJiHuo = getChildByName("jiejinzhaoyunhunanniu") as SimpleButton;
         this.btnJiHuo.addEventListener(MouseEvent.CLICK,this.onClickHandler);
         this.btnXiuXi = getChildByName("jianghunxiuxi") as SimpleButton;
         this.btnXiuXi.addEventListener(MouseEvent.CLICK,this.onClickHandler);
         this.btnChuZhan = getChildByName("jianghunchuzhan") as SimpleButton;
         this.btnChuZhan.addEventListener(MouseEvent.CLICK,this.onClickHandler);
         this.btnZhuRu = getChildByName("zhurujianghunanniu") as Button;
         this.btnZhuRu.addEventListener(MouseEvent.CLICK,this.onClickHandler);
         this.btnZiDong = getChildByName("zidongzhuru") as Button;
         this.btnZiDong.addEventListener(MouseEvent.CLICK,this.onClickHandler);
         this.btnTingZhi = getChildByName("tingzhizhuru") as Button;
         this.btnTingZhi.addEventListener(MouseEvent.CLICK,this.onClickHandler);
         this.btnJiangHun = (getChildByName("xiaohao") as RadioButtonGroup).getChildByName("duigou1") as RadioButton;
         this.btnJiangHun.addEventListener(MouseEvent.CLICK,this.onClickHandler);
         this.btnShengWang = (getChildByName("xiaohao") as RadioButtonGroup).getChildByName("duigou2") as RadioButton;
         this.btnShengWang.addEventListener(MouseEvent.CLICK,this.onClickHandler);
         this.txtMiaoShu = getChildByName("jianghunjieshao") as Label;
         this.txtBenCi = getChildByName("bencixiaohaoshuzhi") as Label;
         this.txtShengYu = getChildByName("dangqianshengyushuzhi") as Label;
         this.itemEquip1 = getChildByName("zhuangbeijinengkuangsuo1") as Image;
         this.itemEquip2 = getChildByName("zhuangbeijinengkuangsuo2") as Image;
         this.itemEquip3 = getChildByName("zhuangbeijinengkuangsuo3") as Image;
         this.itemEquip4 = getChildByName("zhuangbeijinengkuangsuo4") as Image;
         this.itemSkill1 = getChildByName("zhuangbeijinengkuangsuo5") as Image;
         this.itemSkill2 = getChildByName("zhuangbeijinengkuangsuo6") as Image;
         this.itemSkill3 = getChildByName("zhuangbeijinengkuangsuo7") as Image;
         this.itemSkill4 = getChildByName("zhuangbeijinengkuangsuo8") as Image;
         this.imgYinHun1 = getChildByName("yinhunhunzhu1") as Image;
         this.imgYinHun2 = getChildByName("yinhunhunzhu2") as Image;
         this.imgYinHun3 = getChildByName("yinhunhunzhu3") as Image;
         this.imgYinHun4 = getChildByName("yinhunhunzhu4") as Image;
         this.imgYinHun5 = getChildByName("yinhunhunzhu5") as Image;
         this.imgYinHun6 = getChildByName("yinhunhunzhu6") as Image;
         this.imgYinHun7 = getChildByName("yinhunhunzhu7") as Image;
         this.imgYinHun8 = getChildByName("yinhunhunzhu8") as Image;
         this.imgYinHun9 = getChildByName("yinhunhunzhu9") as Image;
         this.imgYinHun10 = getChildByName("yinhunhunzhu10") as Image;
         this.imgYangHun1 = getChildByName("yanghunhunzhu1") as Image;
         this.imgYangHun2 = getChildByName("yanghunhunzhu2") as Image;
         this.imgYangHun3 = getChildByName("yanghunhunzhu3") as Image;
         this.imgYangHun4 = getChildByName("yanghunhunzhu4") as Image;
         this.imgYangHun5 = getChildByName("yanghunhunzhu5") as Image;
         this.imgYangHun6 = getChildByName("yanghunhunzhu6") as Image;
         this.imgYangHun7 = getChildByName("yanghunhunzhu7") as Image;
         this.imgYangHun8 = getChildByName("yanghunhunzhu8") as Image;
         this.imgYangHun9 = getChildByName("yanghunhunzhu9") as Image;
         this.imgYangHun10 = getChildByName("yanghunhunzhu10") as Image;
      }
      
      private function onClickHandler(param1:MouseEvent) : void
      {
         switch(param1.currentTarget)
         {
            case this.btnZuo:
               this.isZiDong = false;
               if(this.currWuIndex <= 0)
               {
                  return;
               }
               --this.currWuIndex;
               this.setBtnWu(this.currWuIndex,this.arrWu);
               dispatchEvent(new BaseEvent(JiangHunPanel_CN.JIANGHUN_CLICK,"",this.currWuIndex + 1));
               break;
            case this.btnYou:
               this.isZiDong = false;
               if(this.arrWu.length - (this.currWuIndex + 1) < 9)
               {
                  return;
               }
               ++this.currWuIndex;
               this.setBtnWu(this.currWuIndex,this.arrWu);
               dispatchEvent(new BaseEvent(JiangHunPanel_CN.JIANGHUN_CLICK,"",this.currWuIndex + 1));
               break;
            case this.btnJiHuo:
               dispatchEvent(new BaseEvent(JiangHunPanel_CN.JIANGHUN_JIHUO_CLICK,"",this.currPage));
               break;
            case this.btnXiuXi:
               PipeManager.sendMsg(PipeConstants.UI_JIANGHUN_HUANZHUANG_CLICK,{"type":false});
               dispatchEvent(new BaseEvent(JiangHunPanel_CN.JIANGHUN_CHUANZHAN_CLICK,"",{
                  "index":this.currPage,
                  "type":0
               }));
               break;
            case this.btnChuZhan:
               dispatchEvent(new BaseEvent(JiangHunPanel_CN.JIANGHUN_CHUANZHAN_CLICK,"",{
                  "index":this.currPage,
                  "type":1
               }));
               PipeManager.sendMsg(PipeConstants.UI_JIANGHUN_HUANZHUANG_CLICK,{
                  "type":true,
                  "index":25
               });
               break;
            case this.btnZhuRu:
               this.isZiDong = false;
               dispatchEvent(new BaseEvent(JiangHunPanel_CN.JIANGHUN_ZHURU_CLICK,"",{
                  "index":this.currPage,
                  "type":this.typeXiaoHao
               }));
               break;
            case this.btnZiDong:
               this.isZiDong = !this.isZiDong;
               if(!this.isZiDong)
               {
                  this.btnZiDong.visible = true;
                  this.btnTingZhi.visible = false;
                  return;
               }
               dispatchEvent(new BaseEvent(JiangHunPanel_CN.JIANGHUN_ZHURU_CLICK,"",{
                  "index":this.currPage,
                  "type":this.typeXiaoHao
               }));
               break;
            case this.btnTingZhi:
               this.isZiDong = false;
               break;
            case this.btnJiangHun:
               dispatchEvent(new BaseEvent(JiangHunPanel_CN.JIANGHUN_XIAOHAO_CLICK,"",{
                  "index":this.currPage,
                  "type":1
               }));
               break;
            case this.btnShengWang:
               dispatchEvent(new BaseEvent(JiangHunPanel_CN.JIANGHUN_XIAOHAO_CLICK,"",{
                  "index":this.currPage,
                  "type":2
               }));
         }
      }
      
      private function onCloseHandler(param1:MouseEvent) : void
      {
         if(Boolean(this.parent) && parent != null)
         {
            parent.removeChild(this);
         }
      }
      
      private function setBtnWu(param1:int, param2:Array) : void
      {
         var _loc4_:NewButton = null;
         var _loc3_:int = 0;
         _loc3_ = 0;
         while(_loc3_ < 9)
         {
            _loc4_ = this.arrBtn[_loc3_] as NewButton;
            _loc4_.label = this.getNameByIndex(param2[_loc3_ + param1].index);
            _loc4_.name = param2[_loc3_ + param1].index + "";
            _loc4_.width = 80;
            _loc4_.align = "center";
            _loc3_++;
         }
      }
      
      public function setJiangHunData(param1:Object) : void
      {
         var i:int;
         var skill:Skill = null;
         var item:ItemFace = null;
         var data:Object = param1;
         this.removeBoxContainer();
         while(this.equipContainers.numChildren > 0)
         {
            this.equipContainers.removeChildAt(0);
         }
         this.currPage = data.index;
         this.arrWu = data.arrWu;
         this.setBtnWu(this.currWuIndex,this.arrWu);
         i = 0;
         if(this.currIndex != data.index)
         {
            this.removeEffectContainer();
            LoaderManager.lazyLoad(function(param1:Event):void
            {
               var _loc2_:LoadingItem = param1.target as LoadingItem;
               var _loc3_:MovieClip = _loc2_.content as MovieClip;
               _loc3_.x = 13;
               _loc3_.y = 45;
               _loc3_.mouseEnabled = false;
               effectContainer.addChild(_loc3_);
            },null,false,GameConfig.fileBaseFolder + "res/ui/UIditu/jianghun/jianghun_" + data.index + ".swf");
            this.currIndex = data.index;
         }
         this.imgBtn = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/jianghun/jiejin.swf");
         this.imgBtn.x = this.btnJiHuo.x;
         this.imgBtn.y = this.btnJiHuo.y - 3;
         this.imgBtnSprite.addChild(this.imgBtn);
         this.imgName = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/jianghun/name_" + data.index + ".swf");
         this.imgName.x = 617;
         this.imgName.y = 94;
         this.boxContainer.addChild(this.imgName);
         this.txtMiaoShu.wordWrap = true;
         this.txtMiaoShu.htmlText = "<textformat leading=\'6\'><font><br>" + "    " + data.miaoShu + "</font></textformat>";
         i = 0;
         while(i < 10)
         {
            if(i < data.numYin)
            {
               this["imgYinHun" + (i + 1)].visible = true;
            }
            else
            {
               this["imgYinHun" + (i + 1)].visible = false;
            }
            if(i < data.numYang)
            {
               this["imgYangHun" + (i + 1)].visible = true;
            }
            else
            {
               this["imgYangHun" + (i + 1)].visible = false;
            }
            i++;
         }
         if(data.isJiHuo)
         {
            this.newLoadingBarCanver.visible = data.isXiaoHao == 2 ? true : false;
            this.newLoadingBarCanver1.visible = !this.newLoadingBarCanver.visible;
            this.newLoadingBarCanver.setNumProgress(data.currPro,data.maxPro);
            this.newLoadingBarCanver1.setNumProgress(data.currPro,data.maxPro);
            this.btnJiHuo.visible = false;
            this.imgBtn.visible = false;
            this.itemEquip1.visible = this.itemEquip2.visible = false;
            this.itemEquip3.visible = this.itemEquip4.visible = data.isJieFeng1 == 1 ? false : true;
            this.itemSkill3.visible = this.itemSkill4.visible = data.isJieFeng2 == 1 ? false : true;
            this.btnChuZhan.visible = data.isChuZhan == 1 ? false : true;
            this.btnXiuXi.visible = !this.btnChuZhan.visible;
            this.txtBenCi.htmlText = data.numBenCi + "";
            this.txtShengYu.htmlText = data.numShengYu + "";
            if(data.isXiaoHao == 1)
            {
               this.btnJiangHun.selected = true;
            }
            else
            {
               this.btnJiangHun.selected = false;
            }
            this.btnShengWang.selected = !this.btnJiangHun.selected;
            this.imgRank1 = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/jianghun/rankbig_" + data.rank + ".swf");
            this.imgRank1.x = 488;
            this.imgRank1.y = 102;
            this.boxContainer.addChild(this.imgRank1);
            this.imgRank2 = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/jianghun/ranksm_" + data.rank + ".swf");
            this.imgRank2.x = 601 - 15;
            this.imgRank2.y = 348;
            this.boxContainer.addChild(this.imgRank2);
            if(data.rank < 4)
            {
               this.imgRank3 = LoadSwf.AndConvert2Bmp(GameConfig.fileBaseFolder + "res/ui/UIditu/jianghun/ranksm_" + (data.rank + 1) + ".swf");
               this.imgRank3.x = 744;
               this.imgRank3.y = 338;
               this.imgRank3.visible = false;
               this.boxContainer.addChild(this.imgRank3);
            }
            this.typeXiaoHao = data.isXiaoHao;
            i = 0;
            while(i < data.arrSkill.length)
            {
               if(data.arrSkill[i].skillID)
               {
                  skill = new Skill(data.arrSkill[i].skillID);
                  skill.isLearn = 1;
                  item = new ItemFace(skill);
                  item.setShowCount(false);
                  item.x = 397 + i * 42;
                  item.y = 448;
                  this.boxContainer.addChild(item);
                  item.filters = data.arrSkill[i].isLearn == 1 ? [] : Tools.blackWhiteFilter;
               }
               i++;
            }
            this.set_JiangHun(GameInstance.mainCharData.goodsInfo.goodsBodyArr);
         }
         else
         {
            this.newLoadingBarCanver.visible = this.newLoadingBarCanver1.visible = false;
            this.btnJiHuo.visible = true;
            this.imgBtn.visible = true;
            this.itemEquip1.visible = this.itemEquip2.visible = this.itemEquip3.visible = this.itemEquip4.visible = true;
            this.btnChuZhan.visible = this.btnXiuXi.visible = false;
            this.txtBenCi.htmlText = this.txtShengYu.htmlText = 0 + "";
         }
         if(this.isZiDong)
         {
            setTimeout(this.ziDongHandler,500);
         }
         else
         {
            this.btnZiDong.visible = true;
            this.btnTingZhi.visible = false;
         }
         this.setJiHuo();
      }
      
      private function onClickWuHunHandler(param1:MouseEvent) : void
      {
         dispatchEvent(new BaseEvent(JiangHunPanel_CN.JIANGHUN_CLICK,"",int(param1.currentTarget.name)));
      }
      
      public function set_JiangHun(param1:Array) : void
      {
         var _loc3_:Goods = null;
         var _loc4_:ItemFace = null;
         var _loc5_:int = 0;
         while(this.equipContainers.numChildren > 0)
         {
            this.equipContainers.removeChildAt(0);
         }
         var _loc2_:int = 0;
         while(_loc2_ < param1.length)
         {
            _loc3_ = param1[_loc2_] as Goods;
            _loc4_ = new ItemFace(_loc3_);
            _loc5_ = (this.currPage - 1) * 4;
            if(_loc3_.res.position == ItemPositionRange.POSTION_JIANGHUN_ZHAOYUN_RONGQI_CN[_loc5_])
            {
               _loc4_.x = 27;
               _loc4_.y = 449;
               this.equipContainers.addChild(_loc4_);
            }
            else if(_loc3_.res.position == ItemPositionRange.POSTION_JIANGHUN_ZHAOYUN_RONGQI_CN[_loc5_ + 1])
            {
               _loc4_.x = 69;
               _loc4_.y = 449;
               this.equipContainers.addChild(_loc4_);
            }
            else if(_loc3_.res.position == ItemPositionRange.POSTION_JIANGHUN_ZHAOYUN_RONGQI_CN[_loc5_ + 2])
            {
               _loc4_.x = 111;
               _loc4_.y = 449;
               this.equipContainers.addChild(_loc4_);
            }
            else if(_loc3_.res.position == ItemPositionRange.POSTION_JIANGHUN_ZHAOYUN_RONGQI_CN[_loc5_ + 3])
            {
               _loc4_.x = 153;
               _loc4_.y = 449;
               this.equipContainers.addChild(_loc4_);
            }
            _loc2_++;
         }
      }
      
      private function ziDongHandler() : void
      {
         this.btnZiDong.visible = false;
         this.btnTingZhi.visible = true;
         dispatchEvent(new BaseEvent(JiangHunPanel_CN.JIANGHUN_ZHURU_CLICK,"",{
            "index":this.currPage,
            "type":this.typeXiaoHao
         }));
      }
      
      public function setSucessed(param1:int) : void
      {
         if(!param1)
         {
            this.isZiDong = false;
            this.btnZiDong.visible = true;
            this.btnTingZhi.visible = false;
         }
      }
      
      public function removeEffectContainer() : void
      {
         while(this.effectContainer.numChildren)
         {
            this.effectContainer.removeChildAt(0);
         }
      }
      
      public function removeBoxContainer() : void
      {
         while(this.imgBtnSprite.numChildren)
         {
            this.imgBtnSprite.removeChildAt(0);
         }
         while(this.boxContainer.numChildren)
         {
            this.boxContainer.removeChildAt(0);
         }
      }
      
      private function getNameByIndex(param1:int) : String
      {
         switch(param1)
         {
            case 1:
               return LanResManager.getLanCommonTextWords("赵  云");
            case 2:
               return LanResManager.getLanCommonTextWords("关  羽");
            case 3:
               return LanResManager.getLanCommonTextWords("张  飞");
            case 4:
               return LanResManager.getLanCommonTextWords("黄  忠");
            case 5:
               return LanResManager.getLanCommonTextWords("吕  布");
            case 6:
               return LanResManager.getLanCommonTextWords("貂  蝉");
            case 7:
               return LanResManager.getLanCommonTextWords("周  瑜");
            case 8:
               return LanResManager.getLanCommonTextWords("曹  操");
            case 9:
               return LanResManager.getLanCommonTextWords("诸葛亮");
            case 10:
               return LanResManager.getLanCommonTextWords("马  超");
            case 11:
               return LanResManager.getLanCommonTextWords("小  乔");
            case 12:
               return LanResManager.getLanCommonTextWords("典  韦");
            case 13:
               return LanResManager.getLanCommonTextWords("太史慈");
            case 14:
               return "Tả Từ";
            case 15:
               return "Đổng Trác";
            case 16:
               return "魏  延";
            case 17:
               return "甄  姬";
            case 18:
               return "郭  嘉";
            case 19:
               return "蚩  尤";
            case 20:
               return "旱  魃";
            case 21:
               return "伏  羲";
            case 22:
               return "石  矶";
            case 23:
               return "雷  神";
            case 24:
               return "梦  魇";
            case 25:
               return "将  臣";
            case 26:
               return "兵  甲";
            case 27:
               return "镇  山";
            case 28:
               return "潘  登";
            case 29:
               return "海  魂";
            case 30:
               return "蛛  魂";
            case 31:
               return "蝶  魂";
            case 32:
               return "葬  魂";
            case 33:
               return "蜥  魂";
            case 34:
               return "蛙  魂";
            case 35:
               return "圣甲魂";
            case 36:
               return "狮  魂";
            case 37:
               return "树  魂";
            default:
               return "";
         }
      }
   }
}

