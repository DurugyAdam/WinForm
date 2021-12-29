using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

#nullable disable

namespace sportiroda.Model
{
    public partial class sportirodaContext : DbContext
    {
        public sportirodaContext()
        {
        }

        public sportirodaContext(DbContextOptions<sportirodaContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Neveze> Nevezes { get; set; }
        public virtual DbSet<Tipu> Tipus { get; set; }
        public virtual DbSet<Verseny> Versenies { get; set; }
        public virtual DbSet<Versenyzo> Versenyzos { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
                optionsBuilder.UseMySql("user id=root;host=localhost;database=sportiroda;character set=uf8", Microsoft.EntityFrameworkCore.ServerVersion.Parse("10.4.14-mariadb"));
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.HasCharSet("utf8")
                .UseCollation("utf8_hungarian_ci");

            modelBuilder.Entity<Neveze>(entity =>
            {
                entity.HasKey(e => e.NevezesId)
                    .HasName("PRIMARY");

                entity.ToTable("nevezes");

                entity.Property(e => e.NevezesId)
                    .HasColumnType("int(11)")
                    .HasColumnName("nevezes_id");

                entity.Property(e => e.VersenyId)
                    .HasColumnType("int(11)")
                    .HasColumnName("verseny_id");

                entity.Property(e => e.VersenyzoId)
                    .HasColumnType("int(11)")
                    .HasColumnName("versenyzo_id");
            });

            modelBuilder.Entity<Tipu>(entity =>
            {
                entity.HasKey(e => e.TipusId)
                    .HasName("PRIMARY");

                entity.ToTable("tipus");

                entity.Property(e => e.TipusId)
                    .HasColumnType("int(11)")
                    .ValueGeneratedNever()
                    .HasColumnName("tipus_id");

                entity.Property(e => e.Nev)
                    .HasMaxLength(30)
                    .HasColumnName("nev");
            });

            modelBuilder.Entity<Verseny>(entity =>
            {
                entity.ToTable("verseny");

                entity.Property(e => e.VersenyId)
                    .HasColumnType("int(11)")
                    .ValueGeneratedNever()
                    .HasColumnName("verseny_id");

                entity.Property(e => e.Datum)
                    .HasColumnType("date")
                    .HasColumnName("datum");

                entity.Property(e => e.Kezdesido)
                    .HasColumnType("time")
                    .HasColumnName("kezdesido");

                entity.Property(e => e.NevezesiDij)
                    .HasColumnType("int(11)")
                    .HasColumnName("nevezesi_dij");

                entity.Property(e => e.Szintido)
                    .HasColumnType("time")
                    .HasColumnName("szintido");

                entity.Property(e => e.TipusId)
                    .HasColumnType("int(11)")
                    .HasColumnName("tipus_id");
            });

            modelBuilder.Entity<Versenyzo>(entity =>
            {
                entity.ToTable("versenyzo");

                entity.Property(e => e.VersenyzoId)
                    .HasColumnType("int(11)")
                    .ValueGeneratedNever()
                    .HasColumnName("versenyzo_id");

                entity.Property(e => e.Email)
                    .HasMaxLength(35)
                    .HasColumnName("email")
                    .UseCollation("utf8_general_ci");

                entity.Property(e => e.Nem)
                    .HasColumnType("int(11)")
                    .HasColumnName("nem");

                entity.Property(e => e.Nev)
                    .HasMaxLength(30)
                    .HasColumnName("nev")
                    .UseCollation("utf8_general_ci");

                entity.Property(e => e.Szuldatum)
                    .HasColumnType("date")
                    .HasColumnName("szuldatum");
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
