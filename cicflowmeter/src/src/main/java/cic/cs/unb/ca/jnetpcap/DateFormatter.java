package cic.cs.unb.ca.jnetpcap;

import java.text.SimpleDateFormat;
import java.time.Instant;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.concurrent.TimeUnit;

public class DateFormatter {
	
	public static String parseDateFromLong(long time, String format){
		try{
			if (format == null){
				format = "dd/MM/yyyy hh:mm:ss";					
			}
			SimpleDateFormat simpleFormatter = new SimpleDateFormat(format);
			Date tempDate = new Date(time);
			return simpleFormatter.format(tempDate);
		}catch(Exception ex){
			System.out.println(ex.toString());
			return "dd/MM/yyyy hh:mm:ss";
		}		
	}

	public static String convertEpochTimestamp2String(long time) {
		return Instant                                                  // Represent a moment as a count since the epoch reference of 1970-01-01T00:00Z.
				.ofEpochSecond(                                          // Instantiate a `Instant` as a count of whole seconds plus fractional second.
						TimeUnit.MICROSECONDS.toSeconds( time ) ,    // Count of whole seconds since the epoch reference.
						TimeUnit.MICROSECONDS.toNanos( time )        // Calculate fractional second as a count of nanoseconds.
								-
								TimeUnit.SECONDS.toNanos(
										TimeUnit.MICROSECONDS.toSeconds( time )
								)
				)                                                        // Returns an `Instant`.
				.toString()                                              // Generate text in standard ISO 8601 format.
				.replace( "T" , " " )                                    // Replace a `T` with a SPACE for desired output format.
				.replace( "Z" , "" );
	}

	public static String convertMilliseconds2String(long time, String format) {

        if (format == null){
            format = "dd/MM/yyyy hh:mm:ss";
        }

		DateTimeFormatter formatter = DateTimeFormatter.ofPattern(format);
        LocalDateTime ldt = LocalDateTime.ofInstant(Instant.ofEpochMilli(time), ZoneId.systemDefault());
        return ldt.format(formatter);
	}

}
