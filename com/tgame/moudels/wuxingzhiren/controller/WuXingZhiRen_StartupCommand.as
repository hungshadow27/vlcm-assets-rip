package com.tgame.moudels.wuxingzhiren.controller
{
   import com.tgame.moudels.wuxingzhiren.model.WuXingZhiRen_MsgReceivedProxy;
   import com.tgame.moudels.wuxingzhiren.model.WuXingZhiRen_MsgSenderProxy;
   import com.tgame.moudels.wuxingzhiren.view.WuXingZhiRen_Mediator;
   import com.tgame.moudels.wuxingzhiren.view.WuXingZhiRen_TargetMediator;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.command.SimpleCommand;
   
   public class WuXingZhiRen_StartupCommand extends SimpleCommand
   {
      
      public function WuXingZhiRen_StartupCommand()
      {
         super();
      }
      
      override public function execute(param1:INotification) : void
      {
         facade.registerProxy(new WuXingZhiRen_MsgReceivedProxy());
         facade.registerProxy(new WuXingZhiRen_MsgSenderProxy());
         facade.registerMediator(new WuXingZhiRen_Mediator());
         facade.registerMediator(new WuXingZhiRen_TargetMediator());
      }
   }
}

