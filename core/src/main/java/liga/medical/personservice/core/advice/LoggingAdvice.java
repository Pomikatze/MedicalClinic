package liga.medical.personservice.core.advice;

import com.fasterxml.jackson.core.JsonProcessingException;
import liga.medical.personservice.core.model.LogEntity;
import liga.medical.personservice.core.service.LogService;
import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.actuate.endpoint.SecurityContext;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;
import java.time.LocalDateTime;
import java.util.Arrays;

@Aspect
@Slf4j
@Component
public class LoggingAdvice {

    LogService logService;

    public LoggingAdvice(LogService logService) {
        this.logService = logService;
    }

    @Pointcut(value = "execution(* liga.medical.personservice.core.controller.*.*(..))")
    public void generalPointcut(){}

    @Around("generalPointcut()")
    public Object appLogging (ProceedingJoinPoint pjp) throws JsonProcessingException {
        String method = pjp.getSignature().getName();
        String className = pjp.getTarget().getClass().toString();
        Object[] array = pjp.getArgs();
        String person = SecurityContextHolder.getContext().getAuthentication().getName();

        LogEntity log = new LogEntity();
        log.setTimestamp(LocalDateTime.now());
        log.setClassName(className);
        log.setMethod(method + " (" + Arrays.toString(array) + ")");
        log.setPerson(person);

        logService.saveLog(log);

        Object object = null;

        try {
            object = pjp.proceed();
        } catch (Throwable e) {
            e.printStackTrace();
        }

        return object;
    }
}
