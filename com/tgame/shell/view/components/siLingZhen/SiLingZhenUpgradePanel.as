package com.tgame.shell.view.components.siLingZhen
{
   import br.com.stimuli.loading.loadingtypes.LoadingItem;
   import com.fireice.alert.FAlert;
   import com.fireice.checkBox.FCheckBox;
   import com.fireice.event.FAlertEvent;
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.text.FLabel;
   import com.fireice.text.FTextArea;
   import com.fireice.util.Tools;
   import com.tgame.PipeConstants;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.common.GameState;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.ui.componets.ColorBar;
   import com.tgame.common.ui.componets.ItemFace;
   import com.tgame.common.ui.componets.SecondButton;
   import com.tgame.common.ui.componets.StaticValue;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.PipeManager;
   import com.tgame.shell.view.components.CharAttribute;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.manager.LoaderManager;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.text.TextFieldAutoSize;
   
   public class SiLingZhenUpgradePanel extends FPanel
   {
      
      public var $parent:DisplayObject;
      
      public var $parent2:DisplayObject;
      
      private var avatar1:MovieClip;
      
      private var avatar2:MovieClip;
      
      public var nameTitle1:FTextArea;
      
      public var nameTitle2:FTextArea;
      
      public var lv1:FLabel;
      
      public var lv2:FLabel;
      
      public var attributeText1:FTextArea;
      
      public var attributeText2:FTextArea;
      
      public var zhufuAddText:FTextArea;
      
      public var zhufuColor:ColorBar;
      
      public var item:ItemFace;
      
      public var upgradeRequire:FTextArea;
      
      public var buyBtn:SecondButton;
      
      public var startBtn:SecondButton;
      
      public var autoBtn:SecondButton;
      
      private var type:int;
      
      private var key1:String;
      
      private var key2:String;
      
      private var zhufu:int;
      
      private var Mask:Sprite;
      
      private var useJLJH:FCheckBox;
      
      private var useJLJH2:FCheckBox;
      
      private var _jilv:int;
      
      private var _zhenqi:int;
      
      private var _count:int;
      
      private var _goodsName:String;
      
      private var _goodsCount:int;
      
      public function SiLingZhenUpgradePanel()
      {
         var _loc3_:FTextArea = null;
         super();
         skin = "panel";
         dragAble = false;
         showCloseButton = true;
         width = 20 + 483;
         height = 353;
         titleText = LanResManager.getLanCommonTextWords("四灵阵进阶");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.Mask = new Sprite();
         this.Mask.graphics.beginFill(0);
         this.Mask.graphics.drawRect(0,0,560,200);
         this.Mask.graphics.endFill();
         var _loc1_:Bitmap = new Bitmap();
         _loc1_.name = "ui.main.char.silingzhen.lv.ui";
         addChild(_loc1_);
         _loc1_.x = 10;
         var _loc2_:Vector.<Bitmap> = new Vector.<Bitmap>();
         _loc2_.push(_loc1_);
         this.DynamicManageImages = _loc2_;
         _loc3_ = new FTextArea();
         _loc3_.textColor = StaticValue.YELLOW;
         _loc3_.filters = StaticValue.filter;
         _loc3_.width = 186;
         _loc3_.height = 113;
         _loc3_.multiline = true;
         _loc3_.wordWrap = true;
         _loc3_.x = 160;
         _loc3_.y = 28 - 8;
         addChild(_loc3_);
         _loc3_.htmlText = "<textformat leading=\'4\'>" + LanResManager.getLanCommonTextWords("操作失败时，会增加下次操作成功的祝福值，祝福值越高则意味着下次操作成功的几率越高，但祝福值将于每天早晨6:00清空，请在本时间前完成提示，以免造成浪费。") + "</textformat>";
         var _loc4_:FLabel = new FLabel();
         _loc4_.textColor = StaticValue.ORANGE;
         _loc4_.filters = StaticValue.filter;
         _loc4_.x = 170 - 15 - 10 - 25;
         _loc4_.y = 139 + 3;
         addChild(_loc4_);
         _loc4_.text = LanResManager.getLanCommonTextWords("成功祝福值");
         _loc4_ = new FLabel();
         _loc4_.textColor = StaticValue.WHITE;
         _loc4_.filters = StaticValue.filter;
         _loc4_.x = 14 + 5;
         _loc4_.y = 188 - 8;
         addChild(_loc4_);
         _loc4_.text = LanResManager.getLanCommonTextWords("当前等级");
         _loc4_ = new FLabel();
         _loc4_.textColor = StaticValue.WHITE;
         _loc4_.filters = StaticValue.filter;
         _loc4_.x = 444 - 65;
         _loc4_.y = 188 - 8;
         addChild(_loc4_);
         _loc4_.text = LanResManager.getLanCommonTextWords("提升后");
         this.nameTitle1 = new FTextArea();
         this.nameTitle1.width = 108;
         this.nameTitle1.height = 20;
         this.nameTitle1.defaultTextFormat = StaticValue.format;
         this.nameTitle1.textColor = StaticValue.WHITE;
         this.nameTitle1.filters = StaticValue.filter;
         addChild(this.nameTitle1);
         this.nameTitle1.x = 28 - 5;
         this.nameTitle1.y = 123;
         this.nameTitle2 = new FTextArea();
         this.nameTitle2.width = 108;
         this.nameTitle2.height = 20;
         this.nameTitle2.defaultTextFormat = StaticValue.format;
         this.nameTitle2.textColor = StaticValue.WHITE;
         this.nameTitle2.filters = StaticValue.filter;
         addChild(this.nameTitle2);
         this.nameTitle2.x = 395 - 15 - 5;
         this.nameTitle2.y = 123;
         this.zhufuAddText = new FTextArea();
         this.zhufuAddText.width = 154;
         this.zhufuAddText.height = 20;
         this.zhufuAddText.defaultTextFormat = StaticValue.format;
         this.zhufuAddText.textColor = StaticValue.ORANGE;
         this.zhufuAddText.filters = StaticValue.filter;
         addChild(this.zhufuAddText);
         this.zhufuAddText.x = 234 - 55;
         this.zhufuAddText.y = 122 + 3;
         this.useJLJH = new FCheckBox();
         this.useJLJH.textColor = StaticValue.YELLOW;
         this.useJLJH.text = LanResManager.getLanCommonTextWords("使用聚灵精华");
         this.useJLJH.x = 235;
         this.useJLJH.y = 182;
         this.useJLJH.visible = false;
         this.useJLJH.addEventListener(MouseEvent.CLICK,this.updateData);
         addChild(this.useJLJH);
         this.useJLJH2 = new FCheckBox();
         this.useJLJH2.textColor = StaticValue.YELLOW;
         this.useJLJH2.text = LanResManager.getLanCommonTextWords("使用神奇四灵锻造丹");
         this.useJLJH2.x = 235;
         this.useJLJH2.y = this.useJLJH.y + 18;
         this.useJLJH2.visible = false;
         this.useJLJH2.addEventListener(MouseEvent.CLICK,this.updateData);
         addChild(this.useJLJH2);
         this.upgradeRequire = new FTextArea();
         this.upgradeRequire.autoSize = TextFieldAutoSize.LEFT;
         this.upgradeRequire.textColor = StaticValue.WHITE;
         this.upgradeRequire.filters = StaticValue.filter;
         addChild(this.upgradeRequire);
         this.upgradeRequire.x = 235 - 35;
         this.upgradeRequire.y = this.useJLJH2.y + 18 - 20;
         this.attributeText1 = new FTextArea();
         this.attributeText1.autoSize = TextFieldAutoSize.LEFT;
         this.attributeText1.textColor = StaticValue.ORANGE;
         this.attributeText1.filters = StaticValue.filter;
         addChild(this.attributeText1);
         this.attributeText1.x = 25;
         this.attributeText1.y = 227 - 20;
         this.attributeText2 = new FTextArea();
         this.attributeText2.autoSize = TextFieldAutoSize.LEFT;
         this.attributeText2.textColor = StaticValue.ORANGE;
         this.attributeText2.filters = StaticValue.filter;
         addChild(this.attributeText2);
         this.attributeText2.x = 438 - 55;
         this.attributeText2.y = 227 - 20;
         this.lv1 = new FLabel();
         this.lv1.textColor = StaticValue.WHITE;
         this.lv1.filters = StaticValue.filter;
         this.lv1.x = 80 + 4;
         this.lv1.y = 188 - 10 + 1;
         addChild(this.lv1);
         this.lv2 = new FLabel();
         this.lv2.textColor = StaticValue.WHITE;
         this.lv2.filters = StaticValue.filter;
         this.lv2.x = 502 - 65;
         this.lv2.y = 188 - 10 + 1;
         addChild(this.lv2);
         this.zhufuColor = new ColorBar(5,150);
         addChild(this.zhufuColor);
         this.zhufuColor.x = 200 + 8;
         this.zhufuColor.y = 144 + 5 - 1;
         this.buyBtn = new SecondButton();
         this.buyBtn.label = LanResManager.getLanCommonTextWords("购买");
         this.buyBtn.x = 207 - this.buyBtn.width / 2 - 40;
         this.buyBtn.y = 254;
         this.startBtn = new SecondButton();
         this.startBtn.label = LanResManager.getLanCommonTextWords("开始提升");
         addChild(this.startBtn);
         this.startBtn.x = 246 - 52;
         this.startBtn.y = 254;
         this.startBtn.addEventListener(MouseEvent.CLICK,this.onClick);
         this.autoBtn = new SecondButton();
         this.autoBtn.label = LanResManager.getLanCommonTextWords("自动提升");
         addChild(this.autoBtn);
         this.autoBtn.x = 339 - 80;
         this.autoBtn.y = 254;
         this.autoBtn.addEventListener(MouseEvent.CLICK,this.onClick);
      }
      
      public function get useGoodsType() : int
      {
         if(this.useJLJH.visible && this.useJLJH.selectState)
         {
            return 1;
         }
         if(this.useJLJH2.visible && this.useJLJH2.selectState)
         {
            return 2;
         }
         return 0;
      }
      
      private function onClose(param1:FCloseEvent) : void
      {
         var e:FCloseEvent = param1;
         var thisThis:DisplayObject = this;
         if(this.zhufu > 0)
         {
            FAlert.okLabel = LanResManager.getLanCommonTextWords("继续提升");
            FAlert.cancelLabel = LanResManager.getLanCommonTextWords("关闭面板");
            FAlert.show("<textformat leading=\'2\'>" + LanResManager.getLanTextWords(this,"当前累计提升祝福值：",[this.zhufu,StaticValue.YELLOW_HTML,StaticValue.RED_HTML]) + "</textformat>","",2,function(param1:FAlertEvent):void
            {
               if(param1.eventData == FAlert.CANCEL)
               {
                  close();
               }
            });
         }
         else
         {
            this.close();
         }
      }
      
      public function close() : void
      {
         if(Boolean(this.avatar1) && Boolean(this.avatar1.parent))
         {
            this.avatar1.parent.removeChild(this.avatar1);
            this.avatar1.stop();
            this.avatar1 = null;
         }
         if(Boolean(this.avatar2) && Boolean(this.avatar2.parent))
         {
            this.avatar2.parent.removeChild(this.avatar2);
            this.avatar2.stop();
            this.avatar2.mask = null;
            this.avatar2 = null;
         }
         if(parent != null)
         {
            parent.removeChild(this);
         }
         this.autoBtn.label = LanResManager.getLanCommonTextWords("自动提升");
         this.$parent2.dispatchEvent(new BaseEvent(CharAttribute.UI_SILINGZHEN_PANEL_UPGRADE_START_AUTO_STOP));
         this.$parent2.dispatchEvent(new BaseEvent(CharAttribute.UI_SILINGZHEN_PANEL_UPGRADE_CLOSE));
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         var e:MouseEvent = param1;
         switch(e.target)
         {
            case this.buyBtn:
               PipeManager.sendMsg(PipeConstants.REQUEST_MALL_GOODS_INFO,[this.item.getBaseItem().id,0]);
               break;
            case this.startBtn:
               this.$parent2.dispatchEvent(new BaseEvent(CharAttribute.UI_SILINGZHEN_PANEL_UPGRADE_START,"",this.type));
               break;
            case this.autoBtn:
               if(this.autoBtn.label == LanResManager.getLanCommonTextWords("自动提升"))
               {
                  FAlert.okLabel = LanResManager.getLanCommonTextWords("自动提升");
                  FAlert.cancelLabel = LanResManager.getLanCommonTextWords("取   消");
                  FAlert.show("<textformat leading=\'2\'>" + LanResManager.getLanTextWords(this,"您希望自动使用背包中的聚灵珠提升当前阵眼等级",[StaticValue.RED_HTML,StaticValue.GREEN_HTML]) + "</textformat>","",2,function(param1:FAlertEvent):void
                  {
                     if(param1.eventData == FAlert.OK)
                     {
                        autoBtn.label = LanResManager.getLanCommonTextWords("停止提升");
                        $parent2.dispatchEvent(new BaseEvent(CharAttribute.UI_SILINGZHEN_PANEL_UPGRADE_START_AUTO,"",type));
                     }
                  });
               }
               else
               {
                  this.$parent2.dispatchEvent(new BaseEvent(CharAttribute.UI_SILINGZHEN_PANEL_UPGRADE_START_AUTO_STOP));
                  this.autoBtn.label = LanResManager.getLanCommonTextWords("自动提升");
               }
         }
      }
      
      public function setUpgradeData(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int, param7:Goods, param8:int, param9:int, param10:Object) : void
      {
         var obj:Object;
         var tmpKey1:String;
         var tmpKey2:String;
         var v1:int = param1;
         var v2:int = param2;
         var v10:int = param3;
         var v3:int = param4;
         var v4:int = param5;
         var v5:int = param6;
         var v6:Goods = param7;
         var v7:int = param8;
         var v8:int = param9;
         var v9:Object = param10;
         this._jilv = v3;
         this._zhenqi = v4;
         this._count = v5;
         this._goodsName = v6.res.name;
         this._goodsCount = v6.count;
         this.zhufu = v2;
         this.type = v8;
         this.zhufuAddText.text = LanResManager.getLanCommonTextWords("祝福值+") + v1;
         this.zhufuColor.setValue(v2,v10);
         this.updateData();
         if(Boolean(this.item) && Boolean(this.item.parent))
         {
            this.item.parent.removeChild(this.item);
         }
         this.item = new ItemFace(v6);
         addChild(this.item);
         this.item.x = 192 - 45 + 3;
         this.item.y = 211 + 1;
         if(v6.count > 0)
         {
            this.item.filters = [];
         }
         else
         {
            this.item.filters = Tools.blackWhiteFilter;
         }
         obj = v9["lv" + v9.status];
         this.nameTitle1.text = this.nameTitle2.text = v9.zhenFaName;
         this.lv1.text = v9.status + LanResManager.getLanCommonTextWords("阶");
         this.attributeText1.htmlText = "<textformat leading=\'\'>" + LanResManager.getLanCommonTextWords("攻击：+") + obj.gongji + "<br>" + LanResManager.getLanCommonTextWords("防御：+") + obj.fangyu + "<br>" + LanResManager.getLanCommonTextWords("生命：+") + obj.hp + "<br>" + (obj.gongjizhengqiang > 0 ? LanResManager.getLanCommonTextWords("攻击增强比例：") + obj.gongjizhengqiang + "%<br>" : "") + (obj.hushifanyu > 0 ? LanResManager.getLanCommonTextWords("忽视防御比例：") + obj.hushifanyu + "%<br>" : "") + (obj.hurtfantan > 0 ? LanResManager.getLanCommonTextWords("反弹伤害比例：") + obj.hurtfantan + "%<br>" : "") + (obj.hurtjianmian > 0 ? LanResManager.getLanCommonTextWords("伤害减免比例：") + obj.hurtjianmian + "%<br>" : "") + "</textformat>";
         tmpKey1 = GameConfig.fileBaseFolder + "res/data/mc/4lingzhen/" + this.getNameByType(v9.type) + ".swf";
         if(this.avatar1 == null || tmpKey1 != this.key1)
         {
            if(Boolean(this.avatar1) && Boolean(this.avatar1.parent))
            {
               this.avatar1.parent.removeChild(this.avatar1);
               this.avatar1.stop();
               this.avatar1 = null;
            }
            this.key1 = tmpKey1;
            LoaderManager.lazyLoad(function(param1:Event):void
            {
               var _loc2_:LoadingItem = param1.target as LoadingItem;
               if(_loc2_.url.url != key1)
               {
                  return;
               }
               if(Boolean(avatar1) && avatar1.parent != null)
               {
                  avatar1.stop();
                  avatar1.parent.removeChild(avatar1);
               }
               avatar1 = _loc2_.content as MovieClip;
               if(avatar1)
               {
                  avatar1.x = -20 + 20 + 5;
                  avatar1.y = -60 + 20 + 20;
                  avatar1.scaleX = 0.8;
                  avatar1.scaleY = 0.8;
                  avatar1.gotoAndStop(v9.status + 1);
                  addChild(avatar1);
                  avatar1.mouseEnabled = false;
                  avatar1.mouseChildren = false;
               }
            },null,false,this.key1);
         }
         obj = v9["lv" + (v9.status + 1)];
         this.nameTitle1.text = this.nameTitle2.text = v9.zhenFaName;
         this.lv2.text = v9.status + 1 + LanResManager.getLanCommonTextWords("阶");
         this.attributeText2.htmlText = "<textformat leading=\'\'>" + LanResManager.getLanCommonTextWords("攻击：+") + obj.gongji + "<br>" + LanResManager.getLanCommonTextWords("防御：+") + obj.fangyu + "<br>" + LanResManager.getLanCommonTextWords("生命：+") + obj.hp + "<br>" + (obj.gongjizhengqiang > 0 ? LanResManager.getLanCommonTextWords("攻击增强比例：") + obj.gongjizhengqiang + "%<br>" : "") + (obj.hushifanyu > 0 ? LanResManager.getLanCommonTextWords("忽视防御比例：") + obj.hushifanyu + "%<br>" : "") + (obj.hurtfantan > 0 ? LanResManager.getLanCommonTextWords("反弹伤害比例：") + obj.hurtfantan + "%<br>" : "") + (obj.hurtjianmian > 0 ? LanResManager.getLanCommonTextWords("伤害减免比例：") + obj.hurtjianmian + "%<br>" : "") + "</textformat>";
         tmpKey2 = GameConfig.fileBaseFolder + "res/data/mc/4lingzhen/" + this.getNameByType(v9.type) + ".swf";
         if(this.avatar2 == null || tmpKey2 != this.key2)
         {
            if(Boolean(this.avatar2) && Boolean(this.avatar2.parent))
            {
               this.avatar2.parent.removeChild(this.avatar2);
               this.avatar2.stop();
               this.avatar2.mask = null;
               this.avatar2 = null;
            }
            this.key2 = tmpKey2;
            LoaderManager.lazyLoad(function(param1:Event):void
            {
               var _loc2_:LoadingItem = param1.target as LoadingItem;
               if(_loc2_.url.url != key2)
               {
                  return;
               }
               if(Boolean(avatar2) && avatar2.parent != null)
               {
                  avatar2.stop();
                  avatar2.parent.removeChild(avatar2);
               }
               avatar2 = _loc2_.content as MovieClip;
               if(avatar2)
               {
                  avatar2.x = 330 + 10 + 5;
                  avatar2.y = -60 + 20 + 20;
                  avatar2.scaleX = 0.8;
                  avatar2.scaleY = 0.8;
                  avatar2.gotoAndStop(v9.status + 2);
                  addChild(avatar2);
                  addChild(Mask);
                  avatar2.mask = Mask;
                  avatar2.mouseEnabled = false;
                  avatar2.mouseChildren = false;
               }
            },null,false,this.key2);
         }
      }
      
      public function updateData(param1:* = null) : void
      {
         var _loc5_:FCheckBox = null;
         if(param1 != null)
         {
            _loc5_ = param1.currentTarget;
            if(_loc5_ == this.useJLJH && _loc5_.selectState)
            {
               this.useJLJH2.selectState = false;
            }
            else if(_loc5_ == this.useJLJH2 && _loc5_.selectState)
            {
               this.useJLJH.selectState = false;
            }
         }
         var _loc2_:int = this._count;
         if(this.useGoodsType == 1)
         {
            _loc2_ = this._count - 1;
         }
         if(this.useGoodsType == 2)
         {
            _loc2_ = 0;
         }
         _loc2_ = Math.max(0,_loc2_);
         var _loc3_:String = this._zhenqi >= GameInstance.mainCharData.attributeInfo.gqNow ? StaticValue.RED_HTML : StaticValue.GREEN_HTML;
         var _loc4_:String = this._count >= this._goodsCount ? StaticValue.RED_HTML : StaticValue.GREEN_HTML;
         this.upgradeRequire.htmlText = "<textformat leading=\'\'>" + LanResManager.getLanCommonTextWords("本次操作成功几率：") + this._jilv + "%<br>" + LanResManager.getLanCommonTextWords("真气：") + "<font color=\'" + _loc3_ + "\'>" + this._zhenqi + "</font><br>" + LanResManager.getLanCommonTextWords("消耗材料：") + "<font color=\'" + _loc4_ + "\'>" + this._goodsName + "*" + _loc2_ + "</font></textformat>";
         this.useJLJH.visible = GameState.gongneng158;
         this.useJLJH2.visible = GameState.gongneng159;
      }
      
      public function getNameByType(param1:int) : String
      {
         var _loc2_:String = "";
         switch(param1)
         {
            case 1:
               _loc2_ = "qinglong";
               break;
            case 2:
               _loc2_ = "baihu";
               break;
            case 3:
               _loc2_ = "zhuque";
               break;
            case 4:
               _loc2_ = "xuanwu";
         }
         return _loc2_;
      }
      
      public function closeMC() : void
      {
         if(Boolean(this.avatar1) && Boolean(this.avatar1.parent))
         {
            this.avatar1.parent.removeChild(this.avatar1);
            this.avatar1.stop();
            this.avatar1 = null;
         }
         if(Boolean(this.avatar2) && Boolean(this.avatar2.parent))
         {
            this.avatar2.parent.removeChild(this.avatar2);
            this.avatar2.stop();
            this.avatar2.mask = null;
            this.avatar2 = null;
         }
         if(Boolean(this.Mask) && Boolean(this.Mask.parent))
         {
            this.Mask.parent.removeChild(this.Mask);
         }
         this.close();
      }
   }
}

